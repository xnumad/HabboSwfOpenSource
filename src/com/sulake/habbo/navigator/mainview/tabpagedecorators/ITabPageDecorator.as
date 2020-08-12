package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.core.window.IWindowContainer;

    public interface ITabPageDecorator 
    {
        function refreshCustomContent(_arg_1:IWindowContainer):void;
        function tabSelected():void;
        function navigatorOpenedWhileInTab():void;
        function refreshFooter(_arg_1:IWindowContainer):void;
        function get filterCategory():String;
        function setSubSelection(_arg_1:int):void;
        function processSearchParam(_arg_1:String):String;
    }
}
