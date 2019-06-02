//com.sulake.core.communication.CoreCommunicationManager

package com.sulake.core.communication{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.communication.connection.IConnectionStateListener;
    import com.sulake.core.communication.connection.IConnection;

    public class CoreCommunicationManager extends Component implements ICoreCommunicationManager, IUpdateReceiver {

        private var _connections:Array;

        public function CoreCommunicationManager(k:IContext, _arg_2:uint=0);

        override public function dispose():void;

        public function createConnection(k:IConnectionStateListener=null):IConnection;

        public function update(k:uint):void;


    }
}//package com.sulake.core.communication

