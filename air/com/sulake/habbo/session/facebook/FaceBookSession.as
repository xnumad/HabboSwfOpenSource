//com.sulake.habbo.session.facebook.FaceBookSession

package com.sulake.habbo.session.facebook{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.session.SessionDataManager;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.facebook.FaceBookAuthenticateEvent;
    import com.sulake.habbo.communication.messages.incoming.facebook.FaceBookErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.facebook.FaceBookAppRequestEvent;

    public class FaceBookSession implements IDisposable {

        private static const JS_AUTHENTICATE_FACEBOOK:String;
        private static const ON_FACEBOOK_LOGIN:String;
        private static const ON_FACEBOOK_LOGOUT:String;

        private var _sessionDataManager:SessionDataManager;
        private var _faceBookAuthenticateEvent:IMessageEvent;
        private var _faceBookErrorEvent:IMessageEvent;
        private var _faceBookAppRequestEvent:IMessageEvent;

        public function FaceBookSession(k:SessionDataManager);

        public function dispose():void;

        public function get disposed():Boolean;

        private function onAuthenticate(k:FaceBookAuthenticateEvent):void;

        private function jsFaceBookLogInCallback(k:String, _arg_2:String, _arg_3:String):void;

        private function jsFaceBookLogOutCallback(k:String):void;

        private function onError(k:FaceBookErrorEvent):void;

        private function onAppRequest(k:FaceBookAppRequestEvent):void;


    }
}//package com.sulake.habbo.session.facebook

