package org.openvideoads.vpaid
{
    public interface _Str_5844 
    {
        function get adLinear():Boolean;
        function get _Str_25601():Number;
        function get _Str_23482():Number;
        function get adExpanded():Boolean;
        function get adRemainingTime():Number;
        function get adVolume():Number;
        function get adDuration():Number;
        function get adSkippableState():Boolean;
        function get adCompanions():String;
        function get adIcons():Boolean;
        function set adVolume(_arg_1:Number):void;
        function handshakeVersion(_arg_1:String):String;
        function initAd(_arg_1:Number, _arg_2:Number, _arg_3:String, _arg_4:Number, _arg_5:String, _arg_6:String):void;
        function resizeAd(_arg_1:Number, _arg_2:Number, _arg_3:String):void;
        function startAd():void;
        function stopAd():void;
        function pauseAd():void;
        function resumeAd():void;
        function expandAd():void;
        function collapseAd():void;
        function skipAd():void;
    }
}
