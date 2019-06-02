//com.sulake.core.communication.messages.IMessageParser

package com.sulake.core.communication.messages{
    public /*dynamic*/ interface IMessageParser {

        function flush():Boolean;
        function parse(k:IMessageDataWrapper):Boolean;

    }
}//package com.sulake.core.communication.messages

