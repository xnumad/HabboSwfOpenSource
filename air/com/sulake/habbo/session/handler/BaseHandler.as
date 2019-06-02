//com.sulake.habbo.session.handler.BaseHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;

    public class BaseHandler implements IDisposable {

        private var _connection:IConnection;
        private var _listener:IRoomHandlerListener;
        private var _disposed:Boolean;
        public var _xxxRoomId:int;

        public function BaseHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get connection():IConnection;

        public function get listener():IRoomHandlerListener;


    }
}//package com.sulake.habbo.session.handler

