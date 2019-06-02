//com.sulake.core.communication.messages.IMessageConfiguration

package com.sulake.core.communication.messages{
    import com.sulake.core.utils.Map;

    public /*dynamic*/ interface IMessageConfiguration {

        function get events():Map;
        function get composers():Map;

    }
}//package com.sulake.core.communication.messages

