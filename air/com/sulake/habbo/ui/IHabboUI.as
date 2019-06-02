//com.sulake.habbo.ui.IHabboUI

package com.sulake.habbo.ui{
    import com.sulake.core.runtime.ICoreConfiguration;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.tablet.inventory.IHabboTabletInventory;

    public /*dynamic*/ interface IHabboUI extends ICoreConfiguration {

        function disconnected(k:int):void;
        function get roomSessionManager():IRoomSessionManager;
        function get inventory():IHabboTabletInventory;
        function get toolbar():IToolbar;
        function showAvatarProfile(k:int, _arg_2:String):void;

    }
}//package com.sulake.habbo.ui

