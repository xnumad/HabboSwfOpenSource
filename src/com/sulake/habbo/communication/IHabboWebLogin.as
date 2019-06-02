package com.sulake.habbo.communication
{
    import flash.events.IEventDispatcher;

    public interface IHabboWebLogin extends IEventDispatcher 
    {
        function requestReAuthenticate():void;
        function init():void;
    }
}
