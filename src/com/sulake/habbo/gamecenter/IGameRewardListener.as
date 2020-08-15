package com.sulake.habbo.gamecenter
{
    import flash.display.BitmapData;

    public interface IGameRewardListener 
    {
        function setGameRewardName(_arg_1:String):void;
        function setGameRewardImage(_arg_1:BitmapData):void;
        function setTimeRemaining(_arg_1:int):void;
        function getCurrentlySelectedGame():int;
        function setRewardingOn(_arg_1:Boolean):void;
    }
}
