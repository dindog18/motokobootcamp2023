import Http "http";
import Text "mo:base/Text";
import CertifiedData "mo:base/CertifiedData";
import Option "mo:base/Option";


actor {
    //Here comes the webpage
    public type HttpRequest = Http.HttpRequest;
    public type HttpResponse = Http.HttpResponse;

    public query func http_request_(req : HttpRequest) : async HttpResponse {
        return({
            body = req.body;
            headers = req.headers;
            status_code = 200;
            streaming_strategy = null;
        })
    };

    public query func http_response_get(res : HttpResponse) : async HttpRequest {
        return ({
            body = res.body;
            headers = res.headers;
            method = "GET";
            url = "/";
        })
    };

    public query func http_response_post(res : HttpResponse) : async HttpRequest {
        CertifiedData.set(res.body);
        return ({
            body = Option.get<Blob>(CertifiedData.getCertificate(), res.body);
            headers = res.headers;
            method = "POST";
            url = "/";
        })
    };

    public query func http_response_delete(res : HttpResponse) : async HttpRequest {
        return ({
            body = res.body;
            headers = res.headers;
            method = "DELETE";
            url = "/";
        })
    };
};
