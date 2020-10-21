package com.sulake.habbo.sound
{
    public interface ISongInfo 
    {
        function get loaded():Boolean;
        function get id():int;
        function get diskId():int;
        function get length():int;
        function get name():String;
        function get creator():String;
        function get songData():String;
        function get soundObject():IHabboSound;
    }
}
