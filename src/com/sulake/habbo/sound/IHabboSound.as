package com.sulake.habbo.sound
{
    public interface IHabboSound 
    {
        function play(_arg_1:Number=0):Boolean;
        function stop():Boolean;
        function set volume(_arg_1:Number):void;
        function set position(_arg_1:Number):void;
        function get volume():Number;
        function get position():Number;
        function get length():Number;
        function get ready():Boolean;
        function get finished():Boolean;
        function get fadeOutSeconds():Number;
        function set fadeOutSeconds(_arg_1:Number):void;
        function get fadeInSeconds():Number;
        function set fadeInSeconds(_arg_1:Number):void;
    }
}
