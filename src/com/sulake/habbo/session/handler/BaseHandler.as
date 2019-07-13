package com.sulake.habbo.session.handler
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;

    public class BaseHandler implements IDisposable 
    {
        private var _connection:IConnection;
        private var _listener:IRoomHandlerListener;
        private var _disposed:Boolean = false;
        public var _xxxRoomId:int;

        public function BaseHandler(connection:IConnection, listener:IRoomHandlerListener)
        {
            this._connection = connection;
            this._listener = listener;
        }

        public function dispose():void
        {
            this._connection = null;
            this._listener = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get connection():IConnection
        {
            return this._connection;
        }

        public function get listener():IRoomHandlerListener
        {
            return this._listener;
        }
    }
}
