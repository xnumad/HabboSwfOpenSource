package com.sulake.habbo.ui.widget.infostand
{
    import flash.geom.Point;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.utils.Map;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPetCommandMessage;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;

    public class PetCommandTool 
    {
        private static const _Str_3163:Point = new Point(100, 70);
        private static const _Str_5169:int = 162;
        private static const _Str_8071:int = 16;
        private static const _Str_3835:int = 4;
        private static const _Str_5037:uint = 0xDADADA;
        private static const _Str_4952:uint = 0x3A3A3A;
        private static const _Str_18292:uint = 10513106;
        private static const _Str_17141:uint = 8734654;
        private static const SKILL:String = "skill";
        private static const _Str_18058:int = 15;

        private const _Str_22633:int = 1100;

        private var _widget:InfoStandWidget;
        private var _commandWindow:IFrameWindow;
        private var _commandButtonTemplate:IWindow;
        private var _enabledCommands:Map;
        private var _currentPetId:int;
        private var _currentPetName:String;
        private var _disableTimer:Timer;

        public function PetCommandTool(k:InfoStandWidget)
        {
            this._widget = k;
            this._enabledCommands = new Map();
            this._disableTimer = new Timer(this._Str_22633);
            this._disableTimer.addEventListener(TimerEvent.TIMER, this._Str_24724);
        }

        public static function _Str_2930(k:IWindowContainer):void
        {
            var _local_2:int;
            while (_local_2 < k.numChildren)
            {
                k.getChildAt(_local_2).visible = false;
                _local_2++;
            }
        }

        public static function _Str_2647(k:IWindowContainer):int
        {
            var _local_4:IWindow;
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < k.numChildren)
            {
                _local_4 = k.getChildAt(_local_3);
                if (_local_4.visible)
                {
                    _local_2 = Math.max(_local_2, (_local_4.y + _local_4.height));
                }
                _local_3++;
            }
            return _local_2;
        }

        private static function _Str_12421(k:int, _arg_2:int, _arg_3:uint, _arg_4:uint):BitmapData
        {
            _arg_2 = Math.max(_arg_2, 1);
            k = Math.max(k, 0);
            if (k > _arg_2)
            {
                k = _arg_2;
            }
            var _local_5:Number = (k / _arg_2);
            var _local_6:int = 1;
            var _local_7:BitmapData = new BitmapData(_Str_5169, _Str_8071, false);
            _local_7.fillRect(new Rectangle(0, 0, _local_7.width, _local_7.height), _Str_5037);
            var _local_8:Rectangle = new Rectangle(_local_6, _local_6, (_local_7.width - (_local_6 * 2)), (_local_7.height - (_local_6 * 2)));
            _local_7.fillRect(_local_8, _Str_4952);
            var _local_9:Rectangle = new Rectangle(_local_6, (_local_6 + _Str_3835), (_local_7.width - (_local_6 * 2)), ((_local_7.height - (_local_6 * 2)) - _Str_3835));
            _local_9.width = (_local_5 * _local_9.width);
            _local_7.fillRect(_local_9, _arg_3);
            var _local_10:Rectangle = new Rectangle(_local_6, _local_6, (_local_7.width - (_local_6 * 2)), _Str_3835);
            _local_10.width = (_local_5 * _local_10.width);
            _local_7.fillRect(_local_10, _arg_4);
            return _local_7;
        }


        public function dispose():void
        {
            if (this._disableTimer)
            {
                this._disableTimer.stop();
                this._disableTimer = null;
            }
            if (this._widget)
            {
                this._widget = null;
            }
            if (this._commandWindow)
            {
                this._commandWindow.dispose();
            }
            this._commandWindow = null;
        }

        public function _Str_18025():int
        {
            return this._currentPetId;
        }

        public function isVisible():Boolean
        {
            if (this._commandWindow == null)
            {
                return false;
            }
            return this._commandWindow.visible;
        }

        public function _Str_19046(k:int, _arg_2:String, _arg_3:BitmapData, _arg_4:int, _arg_5:int, _arg_6:Number, _arg_7:int, _arg_8:Array):void
        {
            if (this._commandWindow == null)
            {
                return;
            }
            this._Str_9597(SKILL, ((_arg_5 + _arg_6) * 100), (_arg_7 * 100), _Str_17141, _Str_18292, _arg_4);
            if (this._currentPetId == k)
            {
                return;
            }
            this._currentPetId = k;
            this._currentPetName = _arg_2;
            var _local_9:ITextWindow = (this._commandWindow.findChildByName("pet_name") as ITextWindow);
            if (_local_9 != null)
            {
                _local_9.text = _arg_2;
            }
            this._Str_21945(_arg_3);
            var _local_10:CommandConfiguration = (this._enabledCommands.getValue(k) as CommandConfiguration);
            if (_local_10 == null)
            {
                this._Str_20953();
                this._Str_23280(this._currentPetId);
            }
            else
            {
                this._Str_16721(_local_10);
            }
        }

        public function _Str_21945(k:BitmapData):void
        {
            var _local_3:BitmapData;
            var _local_4:Point;
            var _local_2:IBitmapWrapperWindow = (this._commandWindow.findChildByName("avatar_image") as IBitmapWrapperWindow);
            if (_local_2 != null)
            {
                if (k != null)
                {
                    _local_3 = new BitmapData(_local_2.width, _local_2.height, true, 0);
                    _local_4 = new Point(0, 0);
                    _local_4.x = Math.round(((_local_2.width - k.width) / 2));
                    _local_4.y = Math.round(((_local_2.height - k.height) / 2));
                    _local_3.copyPixels(k, k.rect, _local_4);
                    _local_2.bitmap = _local_3;
                }
                else
                {
                    _local_2.bitmap = null;
                }
                _local_2.invalidate();
            }
        }

        private function _Str_24724(k:TimerEvent):void
        {
            var _local_2:CommandConfiguration = (this._enabledCommands.getValue(this._currentPetId) as CommandConfiguration);
            this._Str_16721(_local_2);
            this._disableTimer.stop();
        }

        public function _Str_23216(k:int, _arg_2:CommandConfiguration):void
        {
            this._enabledCommands.remove(k);
            this._enabledCommands.add(k, _arg_2);
            if (k != this._currentPetId)
            {
                return;
            }
            this._Str_16721(_arg_2);
            this._disableTimer.stop();
        }

        public function _Str_3360(k:Boolean):void
        {
            if (k)
            {
                if (this._commandWindow == null)
                {
                    this._Str_23006();
                }
                this._commandWindow.visible = true;
            }
            else
            {
                if (this._commandWindow != null)
                {
                    this._commandWindow.visible = false;
                }
            }
            this._disableTimer.stop();
        }

        private function _Str_23280(k:int):void
        {
            var _local_2:RoomWidgetPetCommandMessage = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.RWPCM_REQUEST_PET_COMMANDS, k);
            this._widget.messageListener.processWidgetMessage(_local_2);
        }

        private function _Str_23006():void
        {
            var _local_6:BitmapDataAsset;
            var _local_7:BitmapData;
            var k:XmlAsset = (this._widget.assets.getAssetByName("pet_commands") as XmlAsset);
            this._commandWindow = (this._widget.windowManager.buildFromXML((k.content as XML)) as IFrameWindow);
            if (this._commandWindow == null)
            {
                throw (new Error("Failed to construct command window from XML!"));
            }
            this._commandWindow.context.getDesktopWindow().addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_25490);
            this._commandButtonTemplate = IWindowContainer(this._commandWindow.findChildByName("commands_container")).removeChildAt(0);
            var _local_2:IWindow = this._commandWindow.findChildByName("header_button_close");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_22576);
            }
            var _local_3:IWindow = this._commandWindow.findChildByName("description_link");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_25105);
            }
            var _local_4:IWindow = this._commandWindow.findChildByName("avatar_image");
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_25003);
            }
            var _local_5:IBitmapWrapperWindow = (this._commandWindow.findChildByName("status_skill_icon") as IBitmapWrapperWindow);
            if (_local_5 != null)
            {
                _local_6 = (this._widget.assets.getAssetByName("icon_pet_skill") as BitmapDataAsset);
                _local_7 = (_local_6.content as BitmapData);
                _local_5.bitmap = _local_7.clone();
            }
            this._commandWindow.position = _Str_3163;
        }

        private function _Str_16721(k:CommandConfiguration):void
        {
            var _local_11:IButtonWindow;
            var _local_12:int;
            if (this._commandWindow == null)
            {
                return;
            }
            var _local_2:IWindowContainer = IWindowContainer(this._commandWindow.findChildByName("commands_container"));
            _Str_2930(_local_2);
            var _local_3:Array = k._Str_22858;
            var _local_4:int = 25;
            var _local_5:int;
            var _local_6:int = 86;
            var _local_7:int;
            var _local_8:int;
            while (_local_8 < _local_3.length)
            {
                _local_11 = (_local_2.getChildAt(_local_8) as IButtonWindow);
                if (_local_11 == null)
                {
                    _local_11 = (this._commandButtonTemplate.clone() as IButtonWindow);
                    _local_11.addEventListener(WindowMouseEvent.CLICK, this._Str_23490);
                    _local_2.addChild(_local_11);
                }
                _local_11.visible = true;
                _local_12 = _local_3[_local_8];
                _local_11.id = _local_12;
                _local_11.caption = this._widget.localizations.getLocalization(("pet.command." + _local_12));
                if (k._Str_5065(_local_12))
                {
                    _local_11.enable();
                }
                else
                {
                    _local_11.disable();
                }
                _local_11.y = _local_7;
                if ((_local_8 % 2) == 1)
                {
                    _local_7 = (_local_7 + _local_4);
                    _local_11.x = _local_6;
                }
                else
                {
                    _local_11.x = _local_5;
                }
                _local_8++;
            }
            var _local_9:Boolean = this._widget.config.getBoolean("pet.enhancements.enabled");
            var _local_10:int = ((_local_9) ? 180 : 160);
            _local_2.height = _Str_2647(_local_2);
            this._commandWindow.height = (_local_2.height + _local_10);
            this._disableTimer.stop();
        }

        private function _Str_20953():void
        {
            var _local_3:IButtonWindow;
            if (this._commandWindow == null)
            {
                return;
            }
            var k:IWindowContainer = IWindowContainer(this._commandWindow.findChildByName("commands_container"));
            var _local_2:int;
            while (_local_2 < k.numChildren)
            {
                _local_3 = IButtonWindow(k.getChildAt(_local_2));
                _local_3.disable();
                _local_2++;
            }
        }

        private function _Str_22576(k:WindowMouseEvent):void
        {
            this._commandWindow.visible = false;
        }

        private function _Str_25105(k:WindowMouseEvent):void
        {
            this._widget.windowManager.openHelpPage("help/pets/training");
        }

        private function _Str_25003(k:WindowMouseEvent):void
        {
            this._widget.messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.RWUAM_REQUEST_PET_UPDATE, this._currentPetId));
        }

        private function _Str_23490(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = k.target;
            var _local_3:int = _local_2.id;
            var _local_4:String = ("pet.command." + _local_3);
            var _local_5:String = this._widget.localizations.getLocalization(_local_4);
            var _local_6:RoomWidgetPetCommandMessage = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.RWPCM_PET_COMMAND, this._currentPetId, ((this._currentPetName + " ") + _local_5));
            this._widget.messageListener.processWidgetMessage(_local_6);
            this._Str_20953();
            this._disableTimer.start();
        }

        private function _Str_25490(k:WindowEvent):void
        {
            var _local_2:IWindow;
            var _local_3:Rectangle;
            if (((this._commandWindow) && (!(this._commandWindow.disposed))))
            {
                _local_2 = k.window;
                _local_3 = new Rectangle();
                this._commandWindow.getGlobalRectangle(_local_3);
                if (_local_3.x > _local_2.width)
                {
                    this._commandWindow.x = (_local_2.width - this._commandWindow.width);
                    this._commandWindow.getGlobalRectangle(_local_3);
                }
                if ((_local_3.x + _local_3.width) <= 0)
                {
                    this._commandWindow.x = 0;
                    this._commandWindow.getGlobalRectangle(_local_3);
                }
                if (_local_3.y > _local_2.height)
                {
                    this._commandWindow.y = 0;
                    this._commandWindow.getGlobalRectangle(_local_3);
                }
                if ((_local_3.y + _local_3.height) <= 0)
                {
                    this._commandWindow.y = 0;
                    this._commandWindow.getGlobalRectangle(_local_3);
                }
            }
        }

        private function _Str_9597(k:String, _arg_2:int, _arg_3:int, _arg_4:uint, _arg_5:uint, _arg_6:int):void
        {
            var _local_11:BitmapData;
            if (this._commandWindow == null)
            {
                return;
            }
            var _local_7:IWindowContainer = (this._commandWindow.findChildByName((("status_" + k) + "_container")) as IWindowContainer);
            if (_local_7 == null)
            {
                return;
            }
            _local_7.visible = ((this._widget.config.getBoolean("pet.enhancements.enabled")) && (_arg_6 == _Str_18058));
            var _local_8:ITextWindow = (_local_7.findChildByName((("status_" + k) + "_value_text")) as ITextWindow);
            if (_local_8 != null)
            {
                _local_8.text = ((_arg_2 + "/") + _arg_3);
            }
            var _local_9:ITextWindow = (_local_7.findChildByName((("status_" + k) + "_text")) as ITextWindow);
            if (_local_9 != null)
            {
                _local_9.caption = (("${infostand.pet.text.skill.next." + _arg_6) + "}");
            }
            var _local_10:IBitmapWrapperWindow = (_local_7.findChildByName((("status_" + k) + "_bitmap")) as IBitmapWrapperWindow);
            if (_local_10 != null)
            {
                _local_11 = _Str_12421(_arg_2, _arg_3, _arg_4, _arg_5);
                if (_local_11 != null)
                {
                    _local_10.bitmap = _local_11;
                    _local_10.width = _local_11.width;
                    _local_10.height = _local_11.height;
                    _local_10.invalidate();
                }
            }
        }
    }
}
