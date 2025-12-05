///@description 
var _url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent";
var _map = ds_map_create();
var _prompt = "Create a fun puzzle inspired by the NYT games connections. The response should present each category as follows, category name: [t1, t2, t3, t4]"
ds_map_add(_map, "x-goog-api-key", GEMINI_API_KEY);
ds_map_add(_map, "Content-Type", "application/json")
var _data = {
                contents: 
                [ {
                    parts: 
                    [ {
                        text: "This is a test", 
                    } ] 
                } ]
            }


request_id = http_request(_url, "POST", _map, json_stringify(_data));

//ds_map_clear(_map);
show_debug_message("data{0}", json_stringify(_data));
//show_debug_message("requset {0}", request_id);

/*
curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent" \
  -H "x-goog-api-key: $GEMINI_API_KEY" \
  -H 'Content-Type: application/json' \
  -X POST \
  -d '{
    "contents": [
      {
        "parts": [
          {
            "text": "How does AI work?"
          }
        ]
      }
    ]
  }'