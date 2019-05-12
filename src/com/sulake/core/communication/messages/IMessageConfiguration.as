package com.sulake.core.communication.messages
{
    import com.sulake.core.utils.Map;

    public interface IMessageConfiguration 
    {
        function get events():Map;
        function get composers():Map;
    }
}
