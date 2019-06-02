package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import flash.geom.Point;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_7532;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_4916;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_7454;

    public class QuestDetails implements IDisposable 
    {
        private static const _Str_7408:int = 56;
        private static const _Str_2942:int = 5;
        private static const _Str_8154:int = 5;
        private static const _Str_15189:Point = new Point(8, 8);
        private static const _Str_17957:Array = ["PLACE_ITEM", "PLACE_FLOOR", "PLACE_WALLPAPER", "PET_DRINK", "PET_EAT"];

        private var _questEngine:HabboQuestEngine;
        private var _window:IFrameWindow;
        private var _openForNextQuest:Boolean;
        private var _quest:_Str_2455;
        private var _msecsToRefresh:int;
        private var _goToRoomsOnActivate:Boolean = false;

        public function QuestDetails(k:HabboQuestEngine)
        {
            this._questEngine = k;
        }

        public function dispose():void
        {
            this._questEngine = null;
            this._quest = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        public function _Str_4750(k:_Str_2455):void
        {
            if (this._openForNextQuest)
            {
                this._openForNextQuest = false;
                this._Str_8199(k);
            }
            else
            {
                if (((this._quest == null) || (!(this._quest.id == k.id))))
                {
                    this.close();
                }
            }
        }

        public function _Str_5657(k:_Str_2455):void
        {
            this.close();
        }

        public function _Str_5242():void
        {
            this.close();
        }

        public function _Str_2960():void
        {
            this.close();
        }

        private function close():void
        {
            if (this._window)
            {
                this._window.visible = false;
            }
        }

        public function _Str_5386(k:_Str_2455):void
        {
            if (((this._window) && (this._window.visible)))
            {
                this._window.visible = false;
                return;
            }
            this._Str_8199(k);
        }

        public function _Str_8199(k:_Str_2455, _arg_2:Boolean=false):void
        {
            var _local_9:IWindowContainer;
            this._quest = k;
            if (k == null)
            {
                return;
            }
            this._goToRoomsOnActivate = _arg_2;
            if (this._window == null)
            {
                this._window = IFrameWindow(this._questEngine.getXmlWindow("QuestDetails"));
                this._window.findChildByTag("close").procedure = this._Str_25061;
                this._window.center();
                _local_9 = this._questEngine._Str_3398._Str_12832._Str_19203(this._Str_17443, this._Str_8215);
                _local_9.x = _Str_15189.x;
                _local_9.y = _Str_15189.y;
                this._window.content.addChild(_local_9);
                this._window.findChildByName("link_region").procedure = this._Str_24196;
            }
            _local_9 = IWindowContainer(this._window.findChildByName("entry_container"));
            this._questEngine._Str_3398._Str_12832.refreshEntryDetails(_local_9, k);
            var _local_3:* = (this._quest._Str_3935 > 0);
            var _local_4:ITextWindow = ITextWindow(_local_9.findChildByName("hint_txt"));
            var _local_5:int = this._Str_21971(_local_4);
            if (!_local_3)
            {
                _local_4.caption = this._questEngine._Str_23561(k);
                _local_4.height = (_local_4.textHeight + _Str_8154);
            }
            _local_4.visible = (!(_local_3));
            var _local_6:int = (this._Str_21971(_local_4) - _local_5);
            var _local_7:int = this._Str_23863("link_region", ((_local_4.y + _local_4.height) + _Str_2942));
            var _local_8:IWindowContainer = IWindowContainer(_local_9.findChildByName("quest_container"));
            _local_8.height = (_local_8.height + (_local_6 + _local_7));
            this._questEngine._Str_3398._Str_12832._Str_19570(_local_9);
            this._window.height = (_local_9.height + _Str_7408);
            this._window.visible = true;
            this._window.activate();
        }

        private function _Str_23863(k:String, _arg_2:int):int
        {
            var _local_3:Boolean = this._Str_20872();
            var _local_4:Boolean = ((!(_local_3)) && (this._Str_19961()));
            var _local_5:Boolean = (((!(_local_3)) && (!(_local_4))) && (this._Str_24222()));
            var _local_6:Boolean = (((_local_3) || (_local_4)) || (_local_5));
            var _local_7:IRegionWindow = IRegionWindow(this._window.findChildByName(k));
            _local_7.y = _arg_2;
            var _local_8:int;
            if (((_local_6) && (!(_local_7.visible))))
            {
                _local_8 = (_Str_2942 + _local_7.height);
            }
            if (((!(_local_6)) && (_local_7.visible)))
            {
                _local_8 = (-(_Str_2942) - _local_7.height);
            }
            _local_7.visible = _local_6;
            _local_7.findChildByName("link_catalog").visible = _local_3;
            _local_7.findChildByName("link_navigator").visible = _local_4;
            _local_7.findChildByName("link_room").visible = _local_5;
            return _local_8;
        }

        private function _Str_20872():Boolean
        {
            return (this._quest._Str_3935 < 1) && (_Str_17957.indexOf(this._quest.type) > -1);
        }

        private function _Str_19961():Boolean
        {
            var k:Boolean = this._questEngine._Str_17631((this._quest._Str_9246() + ".searchtag"));
            var _local_2:Boolean = this._questEngine._Str_17631((this._quest._Str_9246() + ".searchtag"));
            return (this._quest._Str_3935 < 1) && ((k) || (_local_2));
        }

        private function _Str_24222():Boolean
        {
            return ((this._quest._Str_3935 < 1) && (this._questEngine._Str_7575(this._quest))) && (this._questEngine._Str_20111());
        }

        private function _Str_21971(k:ITextWindow):int
        {
            return (k.visible) ? k.height : 0;
        }

        private function _Str_25061(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._window.visible = false;
            }
        }

        public function set _Str_19749(k:Boolean):void
        {
            this._openForNextQuest = k;
        }

        private function _Str_24196(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (this._Str_20872())
                {
                    this._questEngine.openCatalog(this._quest);
                }
                else
                {
                    if (this._Str_19961())
                    {
                        this._questEngine.openNavigator(this._quest);
                    }
                    else
                    {
                        this._questEngine._Str_13260();
                    }
                }
            }
        }

        public function update(k:uint):void
        {
            if (((this._window == null) || (!(this._window.visible))))
            {
                return;
            }
            this._msecsToRefresh = (this._msecsToRefresh - k);
            if (this._msecsToRefresh > 0)
            {
                return;
            }
            this._msecsToRefresh = NextQuestTimer._Str_10934;
            var _local_2:Boolean = this._questEngine._Str_3398._Str_12832._Str_17692(this._window, this._quest);
            if (_local_2)
            {
                this._Str_8199(this._quest, this._goToRoomsOnActivate);
            }
        }

        private function _Str_17443(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (this._questEngine._Str_6927)
                {
                    this._questEngine.send(new _Str_7532(this._quest.id));
                }
                else
                {
                    this._questEngine.send(new _Str_4916(this._quest.id));
                }
                this._window.visible = false;
                this._questEngine._Str_3398._Str_13628.close();
                if (((this._goToRoomsOnActivate) && (this._questEngine._Str_7575(this._quest))))
                {
                    this._questEngine._Str_13260();
                }
            }
        }

        private function _Str_8215(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._questEngine.send(new _Str_7454());
            }
        }
    }
}
