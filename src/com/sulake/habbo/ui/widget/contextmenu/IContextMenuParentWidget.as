package com.sulake.habbo.ui.widget.contextmenu
{
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.ui.widget.IRoomWidgetMessageListener;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.friendlist.IHabboFriendsList;

    public interface IContextMenuParentWidget 
    {
        function get assets():IAssetLibrary;
        function get windowManager():IHabboWindowManager;
        function get messageListener():IRoomWidgetMessageListener;
        function get catalog():IHabboCatalog;
        function get friendList():IHabboFriendsList;
        function removeView(_arg_1:ContextInfoView, _arg_2:Boolean):void;
    }
}
