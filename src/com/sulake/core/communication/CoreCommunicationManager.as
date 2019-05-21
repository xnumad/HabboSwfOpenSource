package com.sulake.core.communication
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.connection.SocketConnection;
    import com.sulake.core.communication.connection.IConnectionStateListener;

    public class CoreCommunicationManager extends Component implements ICoreCommunicationManager, IUpdateReceiver 
    {
        private var _connections:Array;

        public function CoreCommunicationManager(k:IContext, _arg_2:uint=0)
        {
            super(k, _arg_2);
            this._connections = new Array();
            registerUpdateReceiver(this, 0);
        }

        override public function dispose():void
        {
            var k:IConnection;
            removeUpdateReceiver(this);
            for each (k in this._connections)
            {
                k.dispose();
            }
            this._connections = null;
            super.dispose();
        }

        public function createConnection(k:IConnectionStateListener=null):IConnection
        {
            var _local_2:IConnection = new SocketConnection(this, k);
            this._connections.push(_local_2);
            return _local_2;
        }

        public function update(k:uint):void
        {
            var _local_3:IConnection;
            var _local_2:int;
            while (_local_2 < this._connections.length)
            {
                _local_3 = this._connections[_local_2];
                _local_3.processReceivedData();
                if (disposed)
                {
                    return;
                }
                if (_local_3.disposed)
                {
                    this._connections.splice(_local_2, 1);
                }
                else
                {
                    _local_2++;
                }
            }
        }
    }
}
