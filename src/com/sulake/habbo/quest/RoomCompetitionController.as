package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import com.sulake.core.utils.Map;
    import flash.events.TimerEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.enum._Str_10666;
    import com.sulake.habbo.communication.messages.incoming.competition._Str_7630;
    import com.sulake.habbo.communication.messages.parser.competition.CompetitionEntrySubmitResultMessageParser;
    import com.sulake.habbo.communication.messages.incoming.competition.CompetitionEntrySubmitResultEvent;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_4522;
    import com.sulake.habbo.communication.messages.outgoing._Str_301._Str_7424;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_2752;
    import com.sulake.habbo.communication.messages.outgoing._Str_301._Str_4038;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_364._Str_3075;
    import com.sulake.habbo.communication.messages.outgoing._Str_301._Str_10126;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IItemGridWindow;

    public class RoomCompetitionController implements IDisposable, IGetImageListener 
    {
        private static const _Str_13545:int = 270;
        private static const _Str_17846:int = 200;
        private static const _Str_16853:int = 4;

        private var _window:IWindowContainer;
        private var _questEngine:HabboQuestEngine;
        private var _goalCode:String;
        private var _competitionId:int;
        private var _remainingVotes:int;
        private var _submit:Boolean;
        private var _dontShowAgain:Boolean;
        private var _hideTimer:Timer;
        private var _result:int;
        private var _requiredFurniIndexByCallbackId:Map;

        public function RoomCompetitionController(k:HabboQuestEngine)
        {
            this._hideTimer = new Timer(3000, 1);
            this._requiredFurniIndexByCallbackId = new Map();
            super();
            this._questEngine = k;
            this._hideTimer.addEventListener(TimerEvent.TIMER, this._Str_6823);
        }

        public function dispose():void
        {
            this._questEngine = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._hideTimer)
            {
                this._hideTimer.removeEventListener(TimerEvent.TIMER, this._Str_6823);
                this._hideTimer.reset();
                this._hideTimer = null;
            }
            if (this._requiredFurniIndexByCallbackId)
            {
                this._requiredFurniIndexByCallbackId.dispose();
                this._requiredFurniIndexByCallbackId = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._window == null;
        }

        private function _Str_2497(k:IWindow, _arg_2:String, _arg_3:String):void
        {
            var _local_4:String = ((_arg_2 + ".") + _arg_3);
            var _local_5:String = this._questEngine.localization.getLocalization(_local_4, "");
            if (_local_5 == "")
            {
                _local_4 = _arg_2;
                _local_5 = this._questEngine.localization.getLocalization(_local_4, "");
            }
            if (_local_5 == "")
            {
                k.visible = false;
            }
            else
            {
                k.visible = true;
                this._questEngine.localization.registerParameter(_local_4, "competition_name", this._Str_23583());
                this._questEngine.localization.registerParameter(_local_4, "votes", ("" + this._remainingVotes));
                k.caption = (("${" + _local_4) + "}");
            }
        }

        public function _Str_16392(k:_Str_7630):void
        {
            this._remainingVotes = k.getParser()._Str_24679;
            var _local_2:Boolean = k.getParser()._Str_24414;
            var _local_3:int = k.getParser()._Str_3278;
            this.refreshContent(k.getParser().goalId, false, k.getParser().goalCode, _local_3.toString());
            this._Str_6512(((_local_3 == _Str_10666._Str_17690) ? this._Str_24392 : this._Str_24761));
            this._Str_4365().procedure = this._Str_24140;
            this._Str_4365().visible = ((this._remainingVotes > 0) && (_local_2));
            this._Str_19349().visible = _local_2;
        }

        public function _Str_17737(k:CompetitionEntrySubmitResultEvent):void
        {
            if (k.getParser().result == CompetitionEntrySubmitResultMessageParser.ROOM_TOO_OLD)
            {
                return;
            }
            this.refreshContent(k.getParser().goalId, true, k.getParser().goalCode, ("" + k.getParser().result));
            this._result = k.getParser().result;
            if (this._result == CompetitionEntrySubmitResultMessageParser.ASK_FOR_CONFIRM)
            {
                this._Str_6512(null);
                this._Str_4365().procedure = this._Str_25817;
            }
            else
            {
                if (this._result == CompetitionEntrySubmitResultMessageParser.ASK_FOR_ACCEPT_RULES)
                {
                    this._Str_6512(this._Str_16143);
                    this._Str_4365().procedure = this._Str_16362;
                }
                else
                {
                    if (this._result == CompetitionEntrySubmitResultMessageParser.ASK_FOR_SUBMIT)
                    {
                        this._Str_6512(this._Str_16143);
                        this._Str_4365().procedure = this._Str_23403;
                    }
                    else
                    {
                        if (this._result == CompetitionEntrySubmitResultMessageParser.PREREQUISITES_NOT_MET)
                        {
                            this._Str_6512(this._Str_17730);
                            this._Str_4365().visible = false;
                            this._Str_24292(k);
                            this._Str_21297().visible = true;
                        }
                        else
                        {
                            if (this._result == CompetitionEntrySubmitResultMessageParser.SUBMITTED)
                            {
                                this._Str_6512(this._Str_16143);
                                this._Str_4365().procedure = this._Str_2392;
                            }
                            else
                            {
                                if (this._result == CompetitionEntrySubmitResultMessageParser.ROOM_DOOR_NOT_OPEN)
                                {
                                    this._Str_6512(null);
                                    this._Str_4365().procedure = null;
                                    this._Str_4365().visible = false;
                                }
                                else
                                {
                                    if (this._result == CompetitionEntrySubmitResultMessageParser.ROOM_TOO_OLD)
                                    {
                                        this._Str_6512(null);
                                        this._Str_4365().procedure = this._Str_24144;
                                        this._Str_4365().visible = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        private function _Str_6512(k:Function):void
        {
            this._Str_18216().procedure = k;
            this._Str_18216().setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, (!(k == null)));
        }

        public function refreshContent(k:int, _arg_2:Boolean, _arg_3:String, _arg_4:String):void
        {
            this._competitionId = k;
            this._goalCode = _arg_3;
            this._submit = _arg_2;
            this.prepare();
            this._Str_22878(((_arg_2) ? "submit" : "vote"), _arg_4);
            this._Str_4365().visible = true;
            this._Str_25612();
            this._Str_24091();
            this._Str_21297().visible = false;
            this._window.findChildByName("dont_show_again_container").visible = false;
            this._window.findChildByName("normal_container").visible = true;
        }

        private function _Str_25612():void
        {
            this._Str_24025().visible = (!(this._submit));
            this._Str_25551().visible = this._submit;
        }

        private function _Str_24091():void
        {
            this._window.visible = true;
            var k:Rectangle = this._window.desktop.rectangle;
            this._window.x = _Str_13545;
            this._window.y = _Str_16853;
            this._window.width = ((k.width - _Str_13545) - _Str_17846);
            this._window.activate();
        }

        private function _Str_24292(k:CompetitionEntrySubmitResultEvent):void
        {
            var _local_4:String;
            var _local_5:Array;
            var _local_6:String;
            var _local_7:String;
            var _local_8:IWindowContainer;
            var _local_9:ImageResult;
            var _local_2:Array = k.getParser().requiredFurnis;
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_4 = _local_2[_local_3];
                _local_5 = _local_4.split("*");
                _local_6 = _local_5[0];
                _local_7 = ((_local_5.length > 1) ? _local_5[1] : "");
                _local_8 = this._Str_21902((_local_3 + 1));
                if (_local_4 == null)
                {
                    _local_8.visible = false;
                }
                else
                {
                    _local_8.visible = true;
                    _local_8.findChildByName("tick_icon").visible = (!(k.getParser().isMissing(_local_4)));
                    _local_9 = this._questEngine.roomEngine.getGenericRoomObjectImage(_local_6, _local_7, new Vector3d(180, 0, 0), 1, this);
                    if (_local_9.id != 0)
                    {
                        this._requiredFurniIndexByCallbackId.add(_local_9.id, _local_3);
                    }
                    this._Str_21013(_local_3, _local_9.data);
                }
                _local_3++;
            }
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (this._requiredFurniIndexByCallbackId.getValue(k) != null)
            {
                this._Str_21013(this._requiredFurniIndexByCallbackId.getValue(k), _arg_2);
                this._requiredFurniIndexByCallbackId.remove(k);
            }
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_21013(k:int, _arg_2:BitmapData):void
        {
            var _local_3:IWindowContainer = this._Str_21902((k + 1));
            var _local_4:IBitmapWrapperWindow = IBitmapWrapperWindow(_local_3.findChildByName("furni_icon"));
            var _local_5:BitmapData = new BitmapData(_local_4.width, _local_4.height, true, 0);
            if (_arg_2 != null)
            {
                _local_5.copyPixels(_arg_2, _arg_2.rect, new Point(((_local_5.width - _arg_2.width) / 2), ((_local_5.height - _arg_2.height) / 2)));
                _local_4.bitmap = _local_5;
            }
        }

        private function _Str_23583():String
        {
            var k:* = (("roomcompetition." + this._goalCode) + ".name");
            return this._questEngine.localization.getLocalization(k, k);
        }

        private function _Str_22878(k:String, _arg_2:String):void
        {
            this._Str_2497(this._Str_17393(), ("roomcompetition.caption." + k), _arg_2);
            this._Str_2497(this._Str_25844(), ("roomcompetition.info." + k), _arg_2);
            this._Str_2497(this._Str_4365(), ("roomcompetition.button." + k), _arg_2);
            this._Str_2497(this._Str_19349(), ("roomcompetition.buttoninfo." + k), _arg_2);
            this.onResize();
        }

        private function onResize():void
        {
            this._Str_18216().y = ((this._Str_17393().y + this._Str_17393().textHeight) + 5);
        }

        public function _Str_2960():void
        {
            this.close();
        }

        public function onCreditBalance(k:_Str_2752):void
        {
            this.close();
            var _local_2:_Str_4522 = k.getParser();
            var _local_3:Boolean = ((this._questEngine.getInteger("new.identity", 0) == 0) || (!(this._questEngine.getBoolean("new.identity.hide.ui"))));
            if (((!(this._dontShowAgain)) && (_local_3)))
            {
                this._submit = _local_2.owner;
                this._questEngine.send(new _Str_7424());
            }
        }

        public function _Str_25159():void
        {
            this._questEngine.send(new _Str_7424());
        }

        public function _Str_21523():void
        {
            if ((((!(this._window == null)) && (this._window.visible)) && (this._submit)))
            {
                this._questEngine.send(new _Str_4038(this._goalCode, _Str_4038._Str_16111));
            }
        }

        private function close():void
        {
            if (this._window)
            {
                this._window.visible = false;
            }
            this._goalCode = "";
        }

        private function prepare():void
        {
            var k:int;
            if (this._window == null)
            {
                k = 1;
                this._window = IWindowContainer(this._questEngine.getXmlWindow("RoomCompetition", k));
                this._window.findChildByName("close_region").procedure = this._Str_2392;
                this._questEngine.windowManager.getWindowContext(k).getDesktopWindow().addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_3630);
                this._window.findChildByName("dont_show_again_region").procedure = this._Str_24295;
            }
        }

        private function _Str_17730(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._questEngine.catalog.openCatalogPage(this._questEngine.getProperty((("competition." + this._goalCode) + ".catalogPage")));
            }
        }

        private function _Str_24144(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._questEngine.navigator.open();
            }
        }

        private function _Str_16143(k:WindowEvent, _arg_2:IWindow=null):void
        {
            var _local_3:HabboToolbarEvent;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = new HabboToolbarEvent(HabboToolbarEvent.HTE_TOOLBAR_CLICK);
                _local_3._Str_3378 = HabboToolbarIconEnum.RECEPTION;
                this._questEngine.toolbar.events.dispatchEvent(_local_3);
            }
        }

        private function _Str_24761(k:WindowEvent, _arg_2:IWindow=null):void
        {
        }

        private function _Str_24392(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._questEngine.tracking.trackTalentTrackOpen(this._questEngine.sessionDataManager.currentTalentTrack, "roomcompetition");
                this._questEngine.send(new _Str_3075(this._questEngine.sessionDataManager.currentTalentTrack));
            }
        }

        private function _Str_16362(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._questEngine.send(new _Str_4038(this._goalCode, _Str_4038._Str_17637));
            }
        }

        private function _Str_23403(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._questEngine.send(new _Str_4038(this._goalCode, _Str_4038._Str_18299));
            }
        }

        private function _Str_25817(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._questEngine.send(new _Str_4038(this._goalCode, _Str_4038._Str_15919));
            }
        }

        private function _Str_24140(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._questEngine.send(new _Str_10126(this._goalCode));
            }
        }

        private function _Str_2392(k:WindowEvent, _arg_2:IWindow=null):void
        {
            var _local_3:String;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (((this._submit) && (this._result == CompetitionEntrySubmitResultMessageParser.SUBMITTED)))
                {
                    this.close();
                    return;
                }
                _local_3 = ("roomcompetition.dontshowagain.info." + ((this._submit) ? "submit" : "vote"));
                this._window.findChildByName("dont_show_info_txt").caption = this._questEngine.localization.getLocalization(_local_3, _local_3);
                this._window.findChildByName("dont_show_again_container").visible = true;
                this._window.findChildByName("normal_container").visible = false;
                this._hideTimer.reset();
                this._hideTimer.start();
            }
        }

        private function _Str_24295(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._dontShowAgain = true;
                this.close();
            }
        }

        private function _Str_18216():IWindow
        {
            return this._window.findChildByName("info_region");
        }

        private function _Str_25844():IWindow
        {
            return this._window.findChildByName("info_txt");
        }

        private function _Str_19349():IWindow
        {
            return this._window.findChildByName("button_info_txt");
        }

        private function _Str_4365():IWindow
        {
            return this._window.findChildByName("action_button");
        }

        private function _Str_17393():ITextWindow
        {
            return ITextWindow(this._window.findChildByName("caption_txt"));
        }

        private function _Str_21297():IWindow
        {
            return this._window.findChildByName("required_furnis_itemgrid");
        }

        private function _Str_24025():IWindow
        {
            return this._window.findChildByName("vote_image");
        }

        private function _Str_25551():IWindow
        {
            return this._window.findChildByName("submit_image");
        }

        private function _Str_21902(k:int):IWindowContainer
        {
            var _local_4:int;
            var _local_2:IItemGridWindow = IItemGridWindow(this._window.findChildByName("required_furnis_itemgrid"));
            var _local_3:IWindowContainer = IWindowContainer(_local_2._Str_2830(0));
            if (_local_2.numGridItems < k)
            {
                _local_4 = 0;
                while (_local_4 < (k - _local_2.numGridItems))
                {
                    _local_2._Str_2816(_local_3.clone());
                    _local_4++;
                }
            }
            return IWindowContainer(_local_2._Str_2830((k - 1)));
        }

        private function _Str_3630(k:WindowEvent):void
        {
            if (((!(this._window == null)) && (this._window.visible)))
            {
                this.onResize();
            }
        }

        public function set _Str_23471(k:Boolean):void
        {
            this._dontShowAgain = k;
        }

        private function _Str_6823(k:TimerEvent):void
        {
            this.close();
        }
    }
}
