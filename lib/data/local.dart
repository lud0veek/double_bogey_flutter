//Backend Api
const String apiUrl = "192.168.1.101:44370";

//Auth0
const AUTH0_DOMAIN = 'doublebogey.eu.auth0.com';
const AUTH0_CLIENT_ID = 'Cg4tbR3O5SVJFrNfu9hoHxasM8TtGhnX';
const AUTH0_REDIRECT_URI = 'com.doublebogey.mobile://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';
const REFRESH_TOKEN_KEY = 'refresh_token';
bool isProgressing = false;
bool isLoggedIn = false;
String errorMessage = '';
String? name;
