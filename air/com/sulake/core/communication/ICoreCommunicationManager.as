//com.sulake.core.communication.ICoreCommunicationManager

package com.sulake.core.communication{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.communication.connection.IConnectionStateListener;
    import com.sulake.core.communication.connection.IConnection;

    public /*dynamic*/ interface ICoreCommunicationManager extends IUnknown {

        function createConnection(k:IConnectionStateListener=null):IConnection;

    }
}//package com.sulake.core.communication

