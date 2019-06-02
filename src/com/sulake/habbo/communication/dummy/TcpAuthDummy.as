package com.sulake.habbo.communication.dummy
{
    import flash.net.Socket;
    import flash.utils.Timer;
    import flash.events.Event;
    import flash.events.SecurityErrorEvent;
    import flash.events.IOErrorEvent;
    import flash.events.TimerEvent;

    public class TcpAuthDummy 
    {
        private var _socket:Socket;
        private var _timeOutTimer:Timer;
        private var _connectionMadeAndClosed:Boolean;

        public function TcpAuthDummy(k:String, _arg_2:uint)
        {
            this._socket = new Socket();
            this._socket.addEventListener(Event.CONNECT, this.onConnect);
            this._socket.addEventListener(Event.COMPLETE, this.onComplete);
            this._socket.addEventListener(Event.CLOSE, this._Str_2392);
            this._socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
            this._socket.addEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
            this._socket.connect(k, _arg_2);
            this._timeOutTimer = new Timer(3500, 1);
            this._timeOutTimer.addEventListener(TimerEvent.TIMER, this._Str_14338);
            this._timeOutTimer.start();
        }

        private function _Str_14338(k:TimerEvent):void
        {
            this.dispose();
            this._connectionMadeAndClosed = true;
        }

        private function onConnect(k:Event):void
        {
            Logger.log("TcpAuth control socket connected");
            this._Str_11469();
        }

        private function _Str_2392(k:Event):void
        {
            Logger.log("TcpAuth control socket closed");
            this._Str_11469();
        }

        private function onComplete(k:Event):void
        {
            Logger.log("TcpAuth control socket complete");
            this._Str_11469();
        }

        private function onSecurityError(k:SecurityErrorEvent):void
        {
            Logger.log("TcpAuth control socket security error");
            this._Str_11469();
        }

        private function onIOError(k:IOErrorEvent):void
        {
            Logger.log("TcpAuth control socket io error");
            this._Str_11469();
        }

        public function get connected():Boolean
        {
            return (!(this._socket == null)) && (this._socket.connected);
        }

        public function _Str_11469():void
        {
            if (this.connected)
            {
                this.dispose();
            }
            this._connectionMadeAndClosed = true;
        }

        public function dispose():void
        {
            if (this._socket != null)
            {
                if (this._socket.connected)
                {
                    this._socket.close();
                }
                this._socket = null;
            }
        }

        public function get disposed():Boolean
        {
            return !(this.connected);
        }

        public function get _Str_24860():Boolean
        {
            return this._connectionMadeAndClosed;
        }
    }
}
