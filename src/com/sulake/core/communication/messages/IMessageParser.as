package com.sulake.core.communication.messages
{
    public interface IMessageParser 
    {
        function flush():Boolean;
        function parse(data:IMessageDataWrapper):Boolean;
    }
}
