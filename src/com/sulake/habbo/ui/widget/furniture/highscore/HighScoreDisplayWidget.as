package com.sulake.habbo.ui.widget.furniture.highscore
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBubbleWindow;
    import flash.geom.Point;
    import com.sulake.habbo.ui.handler.HighScoreFurniWidgetHandler;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.enum.WindowStyle;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.room.object.data.HighScoreData;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.room.object.data.HighScoreStuffData;

    public class HighScoreDisplayWidget extends ConversionTrackingWidget 
    {
        public static const _Str_8951:int = -1;
        private static const _Str_15987:int = -138;
        private static const _Str_18725:int = -400;
        private static const _Str_21806:int = 0;
        private static const _Str_21875:int = 1;
        private static const _Str_19575:int = 2;
        private static const _Str_21517:int = 0;
        private static const _Str_19512:int = 1;
        private static const _Str_20113:int = 2;
        private static const _Str_20184:int = 3;
        private static const _Str_18189:Array = ["perteam", "mostwins", "classic"];
        private static const _Str_18147:Array = ["alltime", "daily", "weekly", "monthly"];

        private var _rootContainerBackground:IWindowContainer;
        private var _bubble:IBubbleWindow;
        private var _entryTemplate:IWindowContainer;
        private var _roomId:int = -1;
        private var _roomObjId:int = -1;
        private var _lastPosition:Point;

        public function HighScoreDisplayWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            this._lastPosition = new Point(0, 0);
            super(k, _arg_2, _arg_3, _arg_4);
            HighScoreFurniWidgetHandler(k).widget = this;
            this._rootContainerBackground = IWindowContainer(_arg_2.createWindow("room_widget_highscore_background_container", "", WindowType.WINDOW_TYPE_CONTAINER, WindowStyle.WINDOW_STYLE_DEFAULT, WindowParam.WINDOW_PARAM_NULL, new Rectangle(0, 0, 10, 10)));
            this._Str_18177();
            this._rootContainerBackground.addEventListener(WindowEvent.WINDOW_EVENT_PARENT_RESIZED, this._Str_18177);
        }

        private function _Str_18177(k:WindowEvent=null):void
        {
            this._rootContainerBackground.width = this._rootContainerBackground.desktop.width;
            this._rootContainerBackground.height = this._rootContainerBackground.desktop.height;
        }

        override public function get mainWindow():IWindow
        {
            return this._rootContainerBackground;
        }

        override public function dispose():void
        {
            if (this._bubble != null)
            {
                this._Str_2669();
            }
            this._rootContainerBackground.removeEventListener(WindowEvent.WINDOW_EVENT_PARENT_RESIZED, this._Str_18177);
            this._rootContainerBackground.dispose();
            super.dispose();
        }

        public function open(k:int, _arg_2:int, _arg_3:HighScoreStuffData):void
        {
            var _local_5:HighScoreData;
            var _local_6:String;
            var _local_7:String;
            var _local_8:IWindowContainer;
            if (this._bubble != null)
            {
                this._Str_2669();
            }
            if (((!(_arg_3.clearType == _Str_8951)) && (!(_arg_3.scoreType == _Str_8951))))
            {
                _local_6 = HighScoreFurniWidgetHandler(_Str_2470).container.localization.getLocalization(("high.score.display.cleartype." + _Str_18147[_arg_3.clearType]));
                _local_7 = HighScoreFurniWidgetHandler(_Str_2470).container.localization.getLocalization(("high.score.display.scoretype." + _Str_18189[_arg_3.scoreType]));
                HighScoreFurniWidgetHandler(_Str_2470).container.localization.registerParameter("high.score.display.caption", "cleartype", _local_6);
                HighScoreFurniWidgetHandler(_Str_2470).container.localization.registerParameter("high.score.display.caption", "scoretype", _local_7);
            }
            this._roomId = _arg_2;
            this._roomObjId = k;
            this.createWindow();
            if (!this._entryTemplate)
            {
                Logger.log("ERROR: 'entry_template' could not found from high score display's window XML");
                return;
            }
            var _local_4:IItemListWindow = IItemListWindow(this._bubble.findChildByName("entries"));
            for each (_local_5 in _arg_3.entries)
            {
                _local_8 = IWindowContainer(this._entryTemplate.clone());
                _local_8.getChildByName("usernames").caption = this._Str_24324(_local_5.users);
                _local_8.getChildByName("score").caption = _local_5.score.toString();
                _local_4.addListItem(_local_8);
            }
            _local_4.invalidate();
        }

        private function _Str_24324(k:Array):String
        {
            var _local_3:String;
            var _local_2:String = "";
            for each (_local_3 in k)
            {
                _local_2 = ((_local_2 + _local_3) + ", ");
            }
            return _local_2.substr(0, (_local_2.length - 2));
        }

        public function _Str_23957(k:int, _arg_2:int):void
        {
            if (!this._bubble)
            {
                return;
            }
            this._bubble.x = (k + _Str_15987);
            this._bubble.y = (_arg_2 + _Str_18725);
        }

        private function createWindow():void
        {
            var k:IBubbleWindow = IBubbleWindow(windowManager.buildFromXML(XML(assets.getAssetByName("high_score_display_xml").content)));
            this._entryTemplate = IWindowContainer(k.findChildByName("entry_template"));
            IItemListWindow(k.findChildByName("entries")).removeListItem(this._entryTemplate);
            this._bubble = k;
            this._bubble.x = this._lastPosition.x;
            this._bubble.y = this._lastPosition.y;
            this._rootContainerBackground.addChild(k);
        }

        private function _Str_2669():void
        {
            this._rootContainerBackground.removeChild(this._bubble);
            this._lastPosition.x = this._bubble.x;
            this._lastPosition.y = this._bubble.y;
            this._bubble.dispose();
            this._bubble = null;
            this._roomId = _Str_8951;
            this._roomObjId = _Str_8951;
        }

        public function get isOpen():Boolean
        {
            return (!(this._bubble == null)) && (this._bubble.visible);
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get _Str_21467():int
        {
            return this._roomObjId;
        }

        public function close():void
        {
            this._Str_2669();
        }
    }
}
