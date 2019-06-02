//com.sulake.habbo.communication.IHabboWebLogin

package com.sulake.habbo.communication{
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface IHabboWebLogin extends IEventDispatcher {

        function requestReAuthenticate():void;
        function init():void;

    }
}//package com.sulake.habbo.communication

