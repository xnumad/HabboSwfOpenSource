package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.guilds.GuildMembershipsController;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2402;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetGuildSelectedEvent;

    public class GuildBadgeViewCatalogWidget extends CatalogWidget
    {
        private var _groupMembershipsCtrl:GuildMembershipsController;

        public function GuildBadgeViewCatalogWidget(k:IWindowContainer, _arg_2:GuildMembershipsController)
        {
            super(k);
            this._groupMembershipsCtrl = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                this._groupMembershipsCtrl = null;
                super.dispose();
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            _Str_2819(CatalogWidgetEnum.GUILD_BADGE_VIEW);
            events.addEventListener(CatalogWidgetEvent.GUILD_SELECTED, this._Str_16625);
            return true;
        }

        private function _Str_16625(k:CatalogWidgetGuildSelectedEvent):void
        {
            if (disposed)
            {
                return;
            }
            var _local_2:_Str_2402 = (IWidgetWindow(_window.findChildByName("badge")).widget as _Str_2402);
            if (_local_2 != null)
            {
                _local_2.badgeId = k.badgeCode;
                _local_2.groupId = k._Str_3916;
            }
        }
    }
}
