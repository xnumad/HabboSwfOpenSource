package com.sulake.core.runtime.events
{
    public interface ILinkEventTracker 
    {
        function get eventUrlPrefix():String;
        function linkReceived(link:String):void;
    }
}
