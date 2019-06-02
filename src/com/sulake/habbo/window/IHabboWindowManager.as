package com.sulake.habbo.window
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.window.ICoreWindowManager;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContext;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.window.utils._Str_10548;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.core.window.IInputEventTracker;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.IResourceManager;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.utils.Map;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.text.StyleSheet;

    public interface IHabboWindowManager extends IUnknown, ICoreWindowManager 
    {
        function createWindow(_arg_1:String, _arg_2:String="", _arg_3:uint=0, _arg_4:uint=0, _arg_5:uint=0, _arg_6:Rectangle=null, _arg_7:Function=null, _arg_8:uint=0, _arg_9:uint=1, _arg_10:String=""):IWindow;
        function removeWindow(_arg_1:String, _arg_2:uint=1):void;
        function getWindowByName(_arg_1:String, _arg_2:uint=1):IWindow;
        function getActiveWindow(_arg_1:uint=1):IWindow;
        function getWindowContext(_arg_1:uint):IWindowContext;
        function alert(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_Str_2418;
        function _Str_5947(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_Str_2418;
        function _Str_23503(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:uint, _arg_6:Function):_Str_10548;
        function confirm(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_Str_2910;
        function _Str_21720(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_Str_2910;
        function registerLocalizationParameter(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="%"):void;
        function _Str_11270(_arg_1:IInputEventTracker):void;
        function _Str_14802(_arg_1:IInputEventTracker):void;
        function createUnseenItemCounter():IWindowContainer;
        function get resourceManager():IResourceManager;
        function buildModalDialogFromXML(_arg_1:XML):_Str_2784;
        function simpleAlert(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:Map=null, _arg_7:String=null, _arg_8:Function=null, _arg_9:Function=null):void;
        function get assets():IAssetLibrary;
        function registerHintWindow(_arg_1:String, _arg_2:IWindow, _arg_3:int=1):void;
        function unregisterHintWindow(_arg_1:String):void;
        function showHint(_arg_1:String, _arg_2:Rectangle=null):void;
        function hideHint():void;
        function displayFloorPlanEditor():void;
        function openHelpPage(_arg_1:String):void;
        function get habboPagesStyleSheet():StyleSheet;
        function _Str_12248(_arg_1:String):void;
    }
}
