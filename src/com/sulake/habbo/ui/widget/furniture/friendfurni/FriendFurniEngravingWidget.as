package com.sulake.habbo.ui.widget.furniture.friendfurni
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.handler.FriendFurniEngravingWidgetHandler;
    import com.sulake.habbo.ui.widget.enums.FriendFurniEngravingWidgetTypeEnum;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;

    public class FriendFurniEngravingWidget extends ConversionTrackingWidget 
    {
        private var _stuffId:int = -1;
        private var _engravingView:FriendFurniEngravingView;

        public function FriendFurniEngravingWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._Str_11963.widget = this;
        }

        public function get stuffId():int
        {
            return this._stuffId;
        }

        public function get _Str_11963():FriendFurniEngravingWidgetHandler
        {
            return _Str_2470 as FriendFurniEngravingWidgetHandler;
        }

        public function open(k:int, _arg_2:int, _arg_3:StringArrayStuffData):void
        {
            this.close(this._stuffId);
            this._stuffId = k;
            switch (_arg_2)
            {
                case FriendFurniEngravingWidgetTypeEnum._Str_13451:
                    this._engravingView = new LoveLockEngravingView(this, _arg_3);
                    break;
                case FriendFurniEngravingWidgetTypeEnum._Str_17498:
                    break;
                case FriendFurniEngravingWidgetTypeEnum._Str_18746:
                    break;
                case FriendFurniEngravingWidgetTypeEnum._Str_15230:
                    this._engravingView = new WildWestEngravingView(this, _arg_3);
                    break;
                case FriendFurniEngravingWidgetTypeEnum._Str_15778:
                    this._engravingView = new HabboweenEngravingView(this, _arg_3);
                    break;
            }
            this._engravingView.open();
        }

        public function close(k:int):void
        {
            if (((k == this._stuffId) && (this._engravingView)))
            {
                this._engravingView.dispose();
                this._engravingView = null;
                this._stuffId = -1;
            }
        }
    }
}
