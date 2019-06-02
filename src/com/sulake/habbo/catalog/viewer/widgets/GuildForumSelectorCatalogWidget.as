package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.guilds.GuildMembershipsController;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3266;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetShowWarningTextEvent;

    public class GuildForumSelectorCatalogWidget extends GuildSelectorCatalogWidget 
    {
        public function GuildForumSelectorCatalogWidget(k:IWindowContainer, _arg_2:GuildMembershipsController)
        {
            super(k, _arg_2);
        }

        override protected function filterGroupMemberships(k:Array):Array
        {
            var _local_5:_Str_3266;
            var _local_2:Array = new Array();
            var _local_3:int = _Str_5363.catalog.sessionDataManager.userId;
            var _local_4:Boolean = _Str_5363.catalog.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3751);
            for each (_local_5 in k)
            {
                if ((((!(_local_5._Str_21674)) && (!(_local_5.ownerId == _local_3))) && (!(_local_4))))
                {
                }
                else
                {
                    _local_2.push(_local_5);
                }
            }
            return _local_2;
        }

        override protected function selectGroup(k:_Str_3266):void
        {
            super.selectGroup(k);
            events.dispatchEvent(new CatalogWidgetShowWarningTextEvent(((k._Str_21674) ? "${catalog.alert.group_has_forum}" : "")));
        }
    }
}
