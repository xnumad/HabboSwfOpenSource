package com.sulake.habbo.catalog.guilds
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.GuildSelectorCatalogWidget;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_7664;
    import com.sulake.habbo.communication.messages.incoming.users._Str_7452;

    public class GuildMembershipsController 
    {
        private var _catalog:HabboCatalog;
        private var _guildSelectorWidget:GuildSelectorCatalogWidget;

        public function GuildMembershipsController(k:HabboCatalog)
        {
            this._catalog = k;
        }

        public function dispose():void
        {
            this._catalog = null;
            this._guildSelectorWidget = null;
        }

        public function get catalog():HabboCatalog
        {
            return this._catalog;
        }

        public function _Str_24019(k:GuildSelectorCatalogWidget):void
        {
            this._guildSelectorWidget = k;
            this._catalog.connection.send(new _Str_7664());
        }

        public function _Str_24420(k:GuildSelectorCatalogWidget):void
        {
            if (this._guildSelectorWidget == k)
            {
                this._guildSelectorWidget = null;
            }
            else
            {
                Logger.log("ERROR: Tried to unregister a nonregistered group selector catalog widget");
            }
        }

        public function _Str_23306(k:_Str_7452):void
        {
            var _local_2:Array = k.guilds.slice(0, k.guilds.length);
            if (((this._guildSelectorWidget) && (!(this._guildSelectorWidget.disposed))))
            {
                this._guildSelectorWidget._Str_24364(_local_2);
                this._guildSelectorWidget._Str_22864();
            }
        }

        public function _Str_15960(k:int):void
        {
            if (this._guildSelectorWidget != null)
            {
                this._catalog.connection.send(new _Str_7664());
            }
        }
    }
}
