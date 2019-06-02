package com.sulake.habbo.navigator
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2863;
    import com.sulake.core.window.events.WindowEvent;

    public class GuildInfoCtrl implements IDisposable 
    {
        private static const GUILD_INFO:String = "guild_info";

        private var _navigator:IHabboTransitionalNavigator;
        private var _groupId:int;

        public function GuildInfoCtrl(k:IHabboTransitionalNavigator)
        {
            this._navigator = k;
        }

        public function dispose():void
        {
            this._navigator = null;
        }

        public function get disposed():Boolean
        {
            return this._navigator == null;
        }

        public function refresh(k:IWindowContainer, _arg_2:_Str_2370, _arg_3:Boolean=false):void
        {
            var _local_4:IWindowContainer = IWindowContainer(k.findChildByName(GUILD_INFO));
            if (_local_4 == null)
            {
                _local_4 = IWindowContainer(this._navigator.getXmlWindow("guild_info"));
                _local_4.name = GUILD_INFO;
                k.addChild(_local_4);
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_23405);
            }
            if (((_arg_2 == null) || (_arg_2.habboGroupId < 1)))
            {
                _local_4.visible = false;
                return;
            }
            _local_4.visible = true;
            this._navigator.registerParameter("navigator.guildbase", "groupName", _arg_2.groupName);
            _local_4.findChildByName("guild_base_txt").caption = this._navigator.getText("navigator.guildbase");
            var _local_5:_Str_2402 = (IWidgetWindow(k.findChildByName("guild_badge")).widget as _Str_2402);
            _local_5.badgeId = _arg_2._Str_7146;
            _local_5.groupId = _arg_2.habboGroupId;
            this._groupId = _arg_2.habboGroupId;
        }

        private function _Str_23405(k:WindowEvent):void
        {
            this._navigator.send(new _Str_2863(this._groupId, true));
        }
    }
}
