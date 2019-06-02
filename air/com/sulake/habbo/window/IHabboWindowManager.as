//com.sulake.habbo.window.IHabboWindowManager

package com.sulake.habbo.window{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.window.ICoreWindowManager;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContext;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.habbo.window.utils.IAlertDialogWithLink;
    import com.sulake.habbo.window.utils.IConfirmDialog;
    import com.sulake.core.window.IInputEventTracker;
    import com.sulake.core.window.ILinkEventTracker;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.IResourceManager;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.utils.Map;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.text.StyleSheet;

    public /*dynamic*/ interface IHabboWindowManager extends IUnknown, ICoreWindowManager {

        function createWindow(k:String, _arg_2:String="", _arg_3:uint=0, _arg_4:uint=0, _arg_5:uint=0, _arg_6:Rectangle=null, _arg_7:Function=null, _arg_8:uint=0, _arg_9:uint=1, k0:String=""):IWindow;
        function removeWindow(k:String, _arg_2:uint=1):void;
        function getWindowByName(k:String, _arg_2:uint=1):IWindow;
        function getActiveWindow(k:uint=1):IWindow;
        function getWindowContext(k:uint):IWindowContext;
        function alert(k:String, _arg_2:String, _arg_3:uint, _arg_4:Function):IAlertDialog;
        function alertWithLink(k:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:uint, _arg_6:Function):IAlertDialogWithLink;
        function confirm(k:String, _arg_2:String, _arg_3:uint, _arg_4:Function):IConfirmDialog;
        function registerLocalizationParameter(k:String, _arg_2:String, _arg_3:String, _arg_4:String="%"):void;
        function addMouseEventTracker(k:IInputEventTracker):void;
        function removeMouseEventTracker(k:IInputEventTracker):void;
        function addLinkEventTracker(k:ILinkEventTracker):void;
        function removeLinkEventTracker(k:ILinkEventTracker):void;
        function createUnseenItemCounter():IWindowContainer;
        function get resourceManager():IResourceManager;
        function buildModalDialogFromXML(k:XML):IModalDialog;
        function simpleAlert(k:String, _arg_2:String, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:Map=null, _arg_7:String=null, _arg_8:Function=null, _arg_9:Function=null):void;
        function get assets():IAssetLibrary;
        function createLinkEvent(k:String):void;
        function registerHintWindow(k:String, _arg_2:IWindow):void;
        function unregisterHintWindow(k:String):void;
        function showHint(k:String):void;
        function hideHint():void;
        function displayFloorPlanEditor():void;
        function openHelpPage(k:String):void;
        function get habboPagesStyleSheet():StyleSheet;
        function hideMatchingHint(k:String):void;

    }
}//package com.sulake.habbo.window

