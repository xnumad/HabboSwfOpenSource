package com.sulake.habbo.window.utils.floorplaneditor
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4279;
    import com.sulake.habbo.communication.messages.incoming._Str_446._Str_4976;
    import com.sulake.habbo.communication.messages.incoming._Str_446._Str_6566;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4196;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_5417;
    import com.sulake.habbo.communication.messages.incoming.perk._Str_3277;
    import com.sulake.core.window.components.IFrameWindow;
    import flash.utils.Timer;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_6732;
    import flash.events.TimerEvent;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_438._Str_8089;
    import com.sulake.habbo.communication.messages.outgoing._Str_438._Str_7023;
    import flash.utils.ByteArray;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.InteractiveController;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.habbo.communication.messages.outgoing._Str_438._Str_7289;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;
    import com.sulake.habbo.communication.messages.parser.room.layout._Str_5770;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_6347;
    import com.sulake.habbo.communication.messages.parser.perk.PerkAllowancesMessageParser;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.habbo.window.utils.floorplaneditor.binaryData.*;

    public class BCFloorPlanEditor implements IUpdateReceiver 
    {
        public static var _Str_13244:Class = BCFloorPlanEditor__Str_13244;
        public static var _Str_12857:Class = BCFloorPlanEditor__Str_12857;
        private static const _Str_15936:uint = 2000;
        private static const _Str_14397:int = 16;

        private var _windowManager:HabboWindowManagerComponent;
        private var _floorHeightMapMessageEvent:_Str_4279;
        private var _entryTileDataMessageEvent:_Str_4976;
        private var _occupiedTilesMessageEvent:_Str_6566;
        private var _roomVisualizationSettingsMessageEvent:_Str_4196;
        private var _buildersClubSubscriptionStatusMessageEvent:_Str_5417;
        private var _perkAllowancesMessageEvent:_Str_3277;
        private var _floorPlanCache:FloorPlanCache;
        private var _floorPlanPreviewer:FloorPlanPreviewer;
        private var _heightMapEditor:HeightMapEditor;
        private var _importExportDialog:ImportExportDialog;
        private var _lastReceivedMapEvent:_Str_4279;
        private var _editorWindow:IFrameWindow;
        private var _drawModes:Array;
        private var _drawMode:String;
        private var _floorThickness:int;
        private var _wallThickness:int;
        private var _msSinceLastPreviewUpdate:uint;
        private var _bcSecondsLeft:int = 0;
        private var _bcSecondsCountdownTimer:Timer;
        private var _largeFloorPlansAllowed:Boolean = false;
        private var _fixedWallsHeight:int;
        private var _colorMapMouseDown:Boolean = false;
        private var _wallHeightSliderMouseDown:Boolean = false;

        public function BCFloorPlanEditor(k:HabboWindowManagerComponent)
        {
            this._drawModes = ["add_tile", "remove_tile", "increase_height", "decrease_height", "set_enter_tile"];
            this._drawMode = this._drawModes[0];
            super();
            this._floorPlanCache = new FloorPlanCache(this);
            this._windowManager = k;
            if (this._windowManager.communication != null)
            {
                this._floorHeightMapMessageEvent = new _Str_4279(this.onFloorHeightMap);
                this._entryTileDataMessageEvent = new _Str_4976(this._Str_16587);
                this._occupiedTilesMessageEvent = new _Str_6566(this._Str_18596);
                this._roomVisualizationSettingsMessageEvent = new _Str_4196(this.onRoomVisualizationSettings);
                this._buildersClubSubscriptionStatusMessageEvent = new _Str_5417(this._Str_22764);
                this._perkAllowancesMessageEvent = new _Str_3277(this.onPerkAllowances);
                this._windowManager.communication.addHabboConnectionMessageEvent(this._floorHeightMapMessageEvent);
                this._windowManager.communication.addHabboConnectionMessageEvent(this._buildersClubSubscriptionStatusMessageEvent);
                this._windowManager.communication.addHabboConnectionMessageEvent(this._entryTileDataMessageEvent);
                this._windowManager.communication.addHabboConnectionMessageEvent(this._occupiedTilesMessageEvent);
                this._windowManager.communication.addHabboConnectionMessageEvent(this._roomVisualizationSettingsMessageEvent);
                this._windowManager.communication.addHabboConnectionMessageEvent(this._perkAllowancesMessageEvent);
            }
            if (k.roomEngine)
            {
                k.roomEngine.events.addEventListener(RoomEngineEvent.DISPOSED, this._Str_9192);
            }
            k.registerUpdateReceiver(this, 0);
        }

        public static function _Str_8298(k:int):int
        {
            switch (k)
            {
                case 0:
                    return -2;
                case 1:
                    return -1;
                case 3:
                    return 1;
                default:
                    return 0;
            }
        }


        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._floorHeightMapMessageEvent != null)
            {
                this._windowManager.communication.removeHabboConnectionMessageEvent(this._floorHeightMapMessageEvent);
                this._windowManager.communication.removeHabboConnectionMessageEvent(this._entryTileDataMessageEvent);
                this._windowManager.communication.removeHabboConnectionMessageEvent(this._occupiedTilesMessageEvent);
                this._windowManager.communication.removeHabboConnectionMessageEvent(this._roomVisualizationSettingsMessageEvent);
                this._windowManager.communication.removeHabboConnectionMessageEvent(this._buildersClubSubscriptionStatusMessageEvent);
                this._windowManager.communication.removeHabboConnectionMessageEvent(this._perkAllowancesMessageEvent);
                this._floorHeightMapMessageEvent = null;
                this._entryTileDataMessageEvent = null;
                this._occupiedTilesMessageEvent = null;
                this._roomVisualizationSettingsMessageEvent = null;
            }
            if (((this.windowManager.roomEngine) && (!(this.windowManager.roomEngine.disposed))))
            {
                this.windowManager.roomEngine.events.removeEventListener(RoomEngineEvent.DISPOSED, this._Str_9192);
            }
            this._windowManager.removeUpdateReceiver(this);
            this._windowManager = null;
        }

        public function get disposed():Boolean
        {
            return this._windowManager == null;
        }

        private function _Str_22764(k:_Str_5417):void
        {
            var _local_2:_Str_6732 = k.getParser();
            this._bcSecondsLeft = _local_2._Str_3709;
            if (!this._bcSecondsCountdownTimer)
            {
                this._bcSecondsCountdownTimer = new Timer(10000);
                this._bcSecondsCountdownTimer.addEventListener(TimerEvent.TIMER, this._Str_23706);
                this._bcSecondsCountdownTimer.start();
            }
        }

        private function _Str_23706(k:TimerEvent):void
        {
            this._bcSecondsLeft = (this._bcSecondsLeft - 10);
            if (((this._editorWindow) && (this._editorWindow.visible)))
            {
                if (((this._bcSecondsLeft > 0) || (this._windowManager.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3751))))
                {
                    this._editorWindow.findChildByName("save").enable();
                }
                else
                {
                    this._editorWindow.findChildByName("save").disable();
                }
            }
        }

        public function set visible(k:Boolean):void
        {
            if (((this._editorWindow == null) || (this._editorWindow.disposed)))
            {
                this._Str_25134();
            }
            this._editorWindow.visible = k;
            if (k)
            {
                this._windowManager.communication.connection.send(new _Str_8089());
                this._windowManager.communication.connection.send(new _Str_7023());
                this._Str_21392();
                this._Str_25182();
                this._Str_17511(this._fixedWallsHeight);
            }
            else
            {
                this._heightMapEditor._Str_12874 = false;
            }
        }

        public function get visible():Boolean
        {
            return (!(this._editorWindow == null)) && (this._editorWindow.visible);
        }

        private function _Str_25134():void
        {
            var k:ByteArray = (new _Str_13244() as ByteArray);
            var _local_2:XML = new XML(k.readUTFBytes(k.length));
            this._editorWindow = (this._windowManager.buildFromXML(_local_2, 1) as IFrameWindow);
            this._editorWindow.procedure = this._Str_16600;
            this._editorWindow.findChildByName("tile_height_colormap").procedure = this._Str_23239;
            this._editorWindow.findChildByName("wall_height_slider").procedure = this._Str_24859;
            this._editorWindow.center();
            this._floorPlanPreviewer = new FloorPlanPreviewer(this);
            this._heightMapEditor = new HeightMapEditor(this);
            k = (new _Str_12857() as ByteArray);
            this._importExportDialog = new ImportExportDialog(this, new XML(k.readUTFBytes(k.length)));
            this._floorPlanPreviewer._Str_3190();
            this._heightMapEditor._Str_9032();
            this._Str_23811(this._heightMapEditor._Str_17977);
            this._Str_20209("add_tile");
            IItemListWindow(this._editorWindow.findChildByName("heightmap_wrapper")).disableAutodrag = true;
            IItemListWindow(this._editorWindow.findChildByName("preview_wrapper")).disableAutodrag = true;
            if (((!(this._windowManager.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3751))) && (this._bcSecondsLeft <= 0)))
            {
                this._editorWindow.findChildByName("save").disable();
            }
        }

        public function update(k:uint):void
        {
            var _local_2:String;
            if (((!(this._drawMode == "")) && (this._editorWindow)))
            {
                for each (_local_2 in this._drawModes)
                {
                    if (this._drawMode == _local_2)
                    {
                        InteractiveController(this._editorWindow.findChildByName(_local_2)).state = (InteractiveController(this._editorWindow.findChildByName(_local_2)).state | WindowState.PRESSED);
                    }
                    else
                    {
                        InteractiveController(this._editorWindow.findChildByName(_local_2)).state = (InteractiveController(this._editorWindow.findChildByName(_local_2)).state & (~(WindowState.PRESSED)));
                    }
                }
            }
            this._msSinceLastPreviewUpdate = (this._msSinceLastPreviewUpdate + k);
            if (((this._msSinceLastPreviewUpdate > _Str_15936) && (this._floorPlanPreviewer)))
            {
                this._floorPlanPreviewer._Str_3190();
                this._msSinceLastPreviewUpdate = 0;
            }
        }

        private function get _Str_18668():Boolean
        {
            return ICheckBoxWindow(this._editorWindow.findChildByName("walls_fixed_height_enabled_checkbox"))._Str_2365;
        }

        private function _Str_16600(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                    case "cancel":
                        this.visible = false;
                        break;
                    case "refresh":
                        this._floorPlanPreviewer._Str_3190();
                        break;
                    case "save":
                        this._floorThickness = IDropMenuWindow(this._editorWindow.findChildByName("floor_thickness_drop")).selection;
                        this._wallThickness = IDropMenuWindow(this._editorWindow.findChildByName("wall_thickness_drop")).selection;
                        this._windowManager.communication.connection.send(new _Str_7289(this._floorPlanCache._Str_21406(), this._floorPlanCache._Str_7642.x, this._floorPlanCache._Str_7642.y, this._floorPlanCache._Str_6184, _Str_8298(this._wallThickness), _Str_8298(this._floorThickness), ((this._Str_18668) ? this._fixedWallsHeight : -1)));
                        break;
                    case "reload":
                        this._floorPlanCache.onFloorHeightMap(this._lastReceivedMapEvent);
                        if (this._floorPlanPreviewer)
                        {
                            this._floorPlanPreviewer._Str_3190();
                        }
                        if (this._heightMapEditor)
                        {
                            this._heightMapEditor._Str_9032();
                        }
                        this._windowManager.communication.connection.send(new _Str_7023());
                        this._windowManager.communication.connection.send(new _Str_8089());
                        break;
                    case "import_export":
                        this._importExportDialog.visible = (!(this._importExportDialog.visible));
                        break;
                    case "enterdirection_left":
                        this._floorPlanCache._Str_6184++;
                        this._Str_16217();
                        break;
                    case "enterdirection_right":
                        this._floorPlanCache._Str_6184--;
                        this._Str_16217();
                        break;
                    case "zoom":
                        if (this._heightMapEditor._Str_6594 == 1)
                        {
                            this._heightMapEditor._Str_6594 = 2;
                        }
                        else
                        {
                            this._heightMapEditor._Str_6594 = 1;
                        }
                        this._heightMapEditor._Str_9032();
                        break;
                    case "walls_fixed_height_enabled_checkbox":
                        this._Str_17114(this._Str_18668);
                        if (((this._Str_18668) && (this._fixedWallsHeight == -1)))
                        {
                            this._fixedWallsHeight = (parseInt(this._editorWindow.findChildByName("wall_height_number").caption) - 1);
                        }
                        break;
                }
                if (this._drawModes.indexOf(_arg_2.name) != -1)
                {
                    this._Str_20209(_arg_2.name);
                }
            }
        }

        public function _Str_26431(k:KeyboardEvent):void
        {
            if (k.type == KeyboardEvent.KEY_DOWN)
            {
                switch (k.keyCode)
                {
                    case Keyboard.NUMPAD_ADD:
                        this._heightMapEditor._Str_9167++;
                        break;
                    case Keyboard.NUMPAD_SUBTRACT:
                        this._heightMapEditor._Str_9167++;
                        break;
                    case Keyboard.SHIFT:
                        if (this._heightMapEditor)
                        {
                            this._heightMapEditor._Str_12874 = true;
                        }
                        break;
                }
            }
            else
            {
                if (k.type == KeyboardEvent.KEY_UP)
                {
                    if (k.keyCode == Keyboard.SHIFT)
                    {
                        if (this._heightMapEditor)
                        {
                            this._heightMapEditor._Str_12874 = false;
                        }
                    }
                }
            }
        }

        private function _Str_20209(k:String):void
        {
            this._drawMode = k;
        }

        private function _Str_23239(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:WindowMouseEvent;
            var _local_4:uint;
            if (k.type == WindowMouseEvent.DOWN)
            {
                this._colorMapMouseDown = true;
            }
            else
            {
                if (((k.type == WindowMouseEvent.UP) || (k.type == WindowMouseEvent.UP_OUTSIDE)))
                {
                    this._colorMapMouseDown = false;
                }
                else
                {
                    if (((k.type == WindowMouseEvent.CLICK) || ((this._colorMapMouseDown) && (k.type == WindowMouseEvent.MOVE))))
                    {
                        _local_3 = (k as WindowMouseEvent);
                        _local_4 = ((Number(_local_3.localX) / this._editorWindow.findChildByName("tile_height_colormap").width) * this._heightMapEditor._Str_17977.length);
                        this._Str_19677(_local_4);
                        this._heightMapEditor._Str_9167 = _local_4;
                    }
                }
            }
        }

        public function _Str_19677(k:uint):void
        {
            this._editorWindow.findChildByName("tile_height_slider_track").x = (k * (Number(this._editorWindow.findChildByName("tile_height_colormap").width) / this._heightMapEditor._Str_17977.length));
        }

        private function _Str_24859(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:WindowMouseEvent;
            var _local_4:uint;
            if (k.type == WindowMouseEvent.DOWN)
            {
                this._wallHeightSliderMouseDown = true;
            }
            else
            {
                if (((k.type == WindowMouseEvent.UP) || (k.type == WindowMouseEvent.UP_OUTSIDE)))
                {
                    this._wallHeightSliderMouseDown = false;
                }
                else
                {
                    if (((k.type == WindowMouseEvent.CLICK) || ((this._wallHeightSliderMouseDown) && (k.type == WindowMouseEvent.MOVE))))
                    {
                        _local_3 = (k as WindowMouseEvent);
                        _local_4 = ((Number(_local_3.localX) / this._editorWindow.findChildByName("wall_height_slider").width) * _Str_14397);
                        this._Str_17511(_local_4);
                        this._fixedWallsHeight = _local_4;
                    }
                }
            }
            k.stopPropagation();
        }

        public function _Str_17511(k:int):void
        {
            if (k == -1)
            {
                ICheckBoxWindow(this._editorWindow.findChildByName("walls_fixed_height_enabled_checkbox")).unselect();
                this._Str_17114(false);
            }
            else
            {
                ICheckBoxWindow(this._editorWindow.findChildByName("walls_fixed_height_enabled_checkbox")).select();
                this._Str_17114(true);
                this._editorWindow.findChildByName("wall_height_number").caption = (k + 1).toString();
                this._editorWindow.findChildByName("wall_height_slider_track").x = (k * (Number(this._editorWindow.findChildByName("wall_height_slider").width) / _Str_14397));
            }
        }

        private function _Str_17114(k:Boolean):void
        {
            if (k)
            {
                this._editorWindow.findChildByName("wall_height_text").enable();
                this._editorWindow.findChildByName("wall_height_number").enable();
                this._editorWindow.findChildByName("wall_height_slider").enable();
                this._editorWindow.findChildByName("wall_height_slider_track").enable();
                this._editorWindow.findChildByName("wall_height_text").blend = 1;
                this._editorWindow.findChildByName("wall_height_number").blend = 1;
                this._editorWindow.findChildByName("wall_height_slider").blend = 1;
                this._editorWindow.findChildByName("wall_height_slider_track").blend = 1;
            }
            else
            {
                this._editorWindow.findChildByName("wall_height_text").disable();
                this._editorWindow.findChildByName("wall_height_number").disable();
                this._editorWindow.findChildByName("wall_height_slider").disable();
                this._editorWindow.findChildByName("wall_height_slider_track").disable();
                this._editorWindow.findChildByName("wall_height_text").blend = 0.6;
                this._editorWindow.findChildByName("wall_height_number").blend = 0.6;
                this._editorWindow.findChildByName("wall_height_slider").blend = 0.6;
                this._editorWindow.findChildByName("wall_height_slider_track").blend = 0.6;
            }
        }

        private function onFloorHeightMap(k:_Str_4279):void
        {
            this._lastReceivedMapEvent = k;
            this._floorPlanCache.onFloorHeightMap(k);
            this._fixedWallsHeight = k.getParser().fixedWallsHeight;
            if (this._floorPlanPreviewer)
            {
                this._floorPlanPreviewer._Str_3190();
            }
            if (this._heightMapEditor)
            {
                this._heightMapEditor._Str_9032();
            }
            if (this._editorWindow)
            {
                this._Str_17511(this._fixedWallsHeight);
            }
        }

        private function _Str_16587(k:_Str_4976):void
        {
            if (!this._editorWindow)
            {
                return;
            }
            var _local_2:_Str_5770 = k.getParser();
            this._floorPlanCache._Str_7642 = new Point(_local_2.x, _local_2.y);
            this._floorPlanCache._Str_6184 = _local_2.dir;
            if (this._heightMapEditor)
            {
                this._heightMapEditor._Str_9032();
            }
            this._Str_16217();
        }

        private function _Str_18596(k:_Str_6566):void
        {
            this._floorPlanCache._Str_18596(k);
            if (this._heightMapEditor)
            {
                this._heightMapEditor._Str_9032();
            }
        }

        private function onRoomVisualizationSettings(k:_Str_4196):void
        {
            var _local_2:_Str_6347 = k.getParser();
            this._floorThickness = this._Str_10107(_local_2._Str_9990);
            this._wallThickness = this._Str_10107(_local_2._Str_9955);
            this._Str_21392();
        }

        private function onPerkAllowances(k:_Str_3277):void
        {
            var _local_2:PerkAllowancesMessageParser = k.getParser();
            this._largeFloorPlansAllowed = _local_2.isPerkAllowed(PerkEnum.BUILDER_AT_WORK);
        }

        public function _Str_22370(k:BitmapData):void
        {
            var _local_2:IBitmapWrapperWindow = IBitmapWrapperWindow(this._editorWindow.findChildByName("preview_bitmap"));
            _local_2.bitmap = k;
        }

        private function _Str_23811(k:Vector.<Array>):void
        {
            var _local_5:int;
            var _local_6:uint;
            var _local_2:IBitmapWrapperWindow = (this._editorWindow.findChildByName("tile_height_colormap") as IBitmapWrapperWindow);
            _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, false, 0);
            var _local_3:Rectangle = new Rectangle(0, 0, 1, _local_2.height);
            var _local_4:int;
            while (_local_4 < _local_2.width)
            {
                _local_5 = ((Number(_local_4) / _local_2.width) * k.length);
                _local_6 = (((uint((0xFF * k[_local_5][0])) << 16) + (uint((0xFF * k[_local_5][1])) << 8)) + uint((0xFF * k[_local_5][2])));
                _local_3.x = _local_4;
                _local_2.bitmap.fillRect(_local_3, _local_6);
                _local_4++;
            }
        }

        private function _Str_16217():void
        {
            var k:_Str_2483 = (IWidgetWindow(this._editorWindow.findChildByName("enterdirection_ghost_avatar")).widget as _Str_2483);
            k.direction = this._floorPlanCache._Str_6184;
        }

        private function _Str_10107(k:Number):int
        {
            switch (k)
            {
                case 0.25:
                    return 0;
                case 0.5:
                    return 1;
                case 2:
                    return 3;
                default:
                    return 2;
            }
        }

        private function _Str_21392():void
        {
            if (this._editorWindow)
            {
                IDropMenuWindow(this._editorWindow.findChildByName("wall_thickness_drop")).selection = this._wallThickness;
                IDropMenuWindow(this._editorWindow.findChildByName("floor_thickness_drop")).selection = this._floorThickness;
            }
        }

        private function _Str_25182():void
        {
            var k:IScrollbarWindow = (this._editorWindow.findChildByName("heightmap_scroll_horizontal") as IScrollbarWindow);
            var _local_2:IScrollbarWindow = (this._editorWindow.findChildByName("heightmap_scroll_vertical") as IScrollbarWindow);
            var _local_3:IScrollbarWindow = (this._editorWindow.findChildByName("preview_scroll_horizontal") as IScrollbarWindow);
            var _local_4:IScrollbarWindow = (this._editorWindow.findChildByName("preview_scroll_vertical") as IScrollbarWindow);
            k.scrollH = 0.5;
            _local_2.scrollV = 0.5;
            _local_3.scrollH = 0.5;
            _local_4.scrollV = 0.5;
        }

        private function _Str_9192(k:RoomEngineEvent):void
        {
            this.visible = false;
        }

        public function get windowManager():HabboWindowManagerComponent
        {
            return this._windowManager;
        }

        public function get _Str_4964():IBitmapWrapperWindow
        {
            return this._editorWindow.findChildByName("heightmap_bitmap") as IBitmapWrapperWindow;
        }

        public function get _Str_4134():FloorPlanCache
        {
            return this._floorPlanCache;
        }

        public function get _Str_11016():Array
        {
            return this._drawModes;
        }

        public function get _Str_25243():String
        {
            return this._drawMode;
        }

        public function get _Str_20752():HeightMapEditor
        {
            return this._heightMapEditor;
        }

        public function get _Str_22461():Boolean
        {
            return this._largeFloorPlansAllowed;
        }

        public function get _Str_24411():String
        {
            if (this._lastReceivedMapEvent)
            {
                return this._lastReceivedMapEvent.getParser().text;
            }
            return "";
        }

        public function get _Str_6205():int
        {
            return this._floorThickness;
        }

        public function get _Str_5962():int
        {
            return this._wallThickness;
        }

        public function get _Str_22721():int
        {
            return this._bcSecondsLeft;
        }
    }
}
