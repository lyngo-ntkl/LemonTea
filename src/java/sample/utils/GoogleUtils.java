/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import sample.user.GoogleUser;

/**
 *
 * @author Dell
 */
public class GoogleUtils {

    private static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    private static final String GOOGLE_CLIENT_ID = "960459532301-oafhddmngqt7e8e4agc4uo3kc3m72fq7.apps.googleusercontent.com";
    private static final String GOOGLE_CLIENT_SECRET = "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";
    private static final String GOOGLE_REDIRECT_URI = "http://localhost:8084/MilkTeaShopManagement/LoginGoogleController";
    private static final String GOOGLE_GRANT_TYPE = "authorization_code";
    private static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String response = Request.Post(GOOGLE_LINK_GET_TOKEN).bodyForm(Form.form()
                .add("client_id", GOOGLE_CLIENT_ID)
                .add("client_secret", GOOGLE_CLIENT_SECRET)
                .add("redirect_uri", GOOGLE_REDIRECT_URI)
                .add("code", code).add("grant_type", GOOGLE_GRANT_TYPE).build()).execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleUser getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GoogleUser googleUser = new Gson().fromJson(response, GoogleUser.class);
        return googleUser;
    }
}
