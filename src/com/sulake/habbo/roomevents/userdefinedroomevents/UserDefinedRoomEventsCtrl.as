package com.sulake.habbo.roomevents.userdefinedroomevents
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
	import com.sulake.habbo.roomevents.userdefinedroomevents.IUserDefinedRoomEventsCtrl;
    import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.UserDefinedRoomEventsTriggersCtrl;
    import com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes.ActionTypes;
    import com.sulake.habbo.roomevents.userdefinedroomevents.conditions.UserDefinedRoomEventsConditionsCtrl;
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.habbo.roomevents.userdefinedroomevents.help.UserDefinedRoomEventsHelp;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ConditionDefinition;
    import com.sulake.habbo.roomevents.Util;
    import flash.events.Event;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.TriggerOnce;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes.ActionType;
    import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.WiredTrigger;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.UpdateTriggerMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.UpdateActionMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.UpdateConditionMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.ApplySnapshotMessageComposer;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.core.window.events.*;

    public class UserDefinedRoomEventsCtrl 
    {
        public static var _Str_5431:int = 0;
        public static var _Str_4873:int = 1;
        public static var _Str_4991:int = 2;
        public static var _Str_5430:int = 3;

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _window:IFrameWindow;
        private var _configureContainer:IWindowContainer;
        private var _triggerConfs:UserDefinedRoomEventsTriggersCtrl;
        private var _actionTypes:ActionTypes;
        private var _conditionTypes:UserDefinedRoomEventsConditionsCtrl;
        private var _stuffs:Dictionary;
        private var _updated:Triggerable;
        private var _furniHighLighter:UserDefinedRoomEventsVisualizer;
        private var _help:UserDefinedRoomEventsHelp;
        private var _delaySlider:SliderWindowController;

        public function UserDefinedRoomEventsCtrl(k:HabboUserDefinedRoomEvents)
        {
            this._triggerConfs = new UserDefinedRoomEventsTriggersCtrl();
            this._actionTypes = new ActionTypes();
            this._conditionTypes = new UserDefinedRoomEventsConditionsCtrl();
            this._stuffs = new Dictionary();
            super();
            this._roomEvents = k;
            this._furniHighLighter = new UserDefinedRoomEventsVisualizer(k);
            this._help = new UserDefinedRoomEventsHelp(k);
        }

        public function _Str_15677(k:int, _arg_2:String):void
        {
            if (((this._window == null) || (!(this._window.visible))))
            {
                return;
            }
            if (!this._Str_19885())
            {
                return;
            }
            if (this._stuffs[k])
            {
                delete this._stuffs[k];
                this._furniHighLighter.hide(k);
            }
            else
            {
                if (this._Str_10656().length < this._updated.maximumItemSelectionCount)
                {
                    this._stuffs[k] = _arg_2;
                    this._furniHighLighter.show(k);
                }
            }
            this.refresh();
        }

        private function _Str_19885():Boolean
        {
            var k:WiredFurniture = this._Str_3959();
            return !(k.requiresFurni == _Str_5431);
        }

        private function _Str_3959():WiredFurniture
        {
            return this._Str_19071()._Str_15652(this._updated.code);
        }

        private function _Str_19071():IUserDefinedRoomEventsCtrl
        {
            if ((this._updated as TriggerDefinition) != null)
            {
                return this._triggerConfs;
            }
            if ((this._updated as ActionDefinition) != null)
            {
                return this._actionTypes;
            }
            if ((this._updated as ConditionDefinition) != null)
            {
                return this._conditionTypes;
            }
            return null;
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._roomEvents.getXmlWindow("ude_main"));
            this._configureContainer = IWindowContainer(this.find(this._window, "configure_container"));
            Util._Str_6937(this.find(this._configureContainer, "save_button"), this._Str_24143);
            Util._Str_6937(this.find(this._configureContainer, "cancel_save_button"), this._Str_3046);
            Util._Str_6937(this.find(this._configureContainer, "helplink"), this._Str_22441);
            Util._Str_6937(this.find(this._configureContainer, "apply_snapshot_txt"), this._Str_23497);
            Util._Str_6937(this.find(this._configureContainer, "dec_stuff_sel_button"), this._Str_23536);
            Util._Str_6937(this.find(this._configureContainer, "inc_stuff_sel_button"), this._Str_24649);
            this.find(this._configureContainer, "helplink").mouseThreshold = 0;
            this.find(this._configureContainer, "apply_snapshot_txt").mouseThreshold = 0;
            this._delaySlider = new SliderWindowController(this._roomEvents, IWindowContainer(this.find(this._configureContainer, "delay_slider_container")), this._roomEvents.assets, 0, 20, 1);
            this._delaySlider.addEventListener(Event.CHANGE, this._Str_25230);
            this._delaySlider._Str_2526(0);
            this.setIcon("configure_container", "icon_trigger", "trigger_icon_bitmap");
            this.setIcon("configure_container", "icon_action", "action_icon_bitmap");
            this.setIcon("configure_container", "icon_condition", "condition_icon_bitmap");
            var k:IWindow = this._window.findChildByTag("close");
            k.procedure = this._Str_3046;
            this._window.center();
        }

        private function _Str_25230(k:Event):void
        {
            var _local_2:SliderWindowController;
            var _local_3:Number;
            var _local_4:int;
            var _local_5:String;
            if (k.type == Event.CHANGE)
            {
                _local_2 = (k.target as SliderWindowController);
                if (_local_2)
                {
                    _local_3 = _local_2.getValue();
                    _local_4 = int(_local_3);
                    _local_5 = TriggerOnce._Str_11919(_local_4);
                    this._roomEvents.localization.registerParameter("wiredfurni.params.delay", "seconds", _local_5);
                }
            }
        }

        private function setIcon(k:String, _arg_2:String, _arg_3:String="icon_bitmap"):void
        {
            var _local_4:IWindowContainer = IWindowContainer(this.find(this._window, k));
            this._roomEvents.refreshButton(_local_4, _arg_3, true, null, 0, _arg_2);
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.close();
            }
        }

        public function close():void
        {
            if (this._window)
            {
                this._window.visible = false;
                this._furniHighLighter._Str_21701(this._stuffs);
            }
        }

        private function find(k:IWindowContainer, _arg_2:String):IWindow
        {
            var _local_3:IWindow = k.findChildByName(_arg_2);
            if (_local_3 == null)
            {
                throw (new Error((("Window element with name: " + _arg_2) + " cannot be found!")));
            }
            return _local_3;
        }

        public function _Str_18351(k:Triggerable):void
        {
            var _local_3:int;
            var _local_4:IWindowContainer;
            var _local_5:ActionDefinition;
            var _local_6:int;
            this._Str_2755();
            this._updated = k;
            Logger.log(((("Received: " + this._updated) + ", ") + k.code));
            var _local_2:WiredFurniture = this._Str_3959();
            this._furniHighLighter._Str_21701(this._stuffs);
            this._stuffs = new Dictionary();
            for each (_local_3 in this._updated.selectedItems)
            {
                this._stuffs[_local_3] = "yes";
            }
            _local_4 = ((_local_2.hasSpecialInputs) ? this._Str_10876() : null);
            _local_2.onEditStart(_local_4, this._updated);
            this._furniHighLighter._Str_25313(this._stuffs);
            if ((this._updated as ActionDefinition) != null)
            {
                _local_5 = ActionDefinition(this._updated);
                _local_6 = _local_5.delayInPulses;
                this._delaySlider._Str_2526(_local_6);
            }
            this._Str_23934();
            this.refresh();
        }

        private function _Str_23934():void
        {
            var _local_2:WiredFurniture;
            this._Str_17281().visible = false;
            this._Str_21281().visible = false;
            this._Str_21929().visible = false;
            if (this._updated.stuffTypeSelectionEnabled)
            {
                _local_2 = this._Str_3959();
                if (((_local_2.requiresFurni == _Str_4991) || (_local_2.requiresFurni == _Str_5430)))
                {
                    this._Str_21281().visible = true;
                    this._Str_21929().visible = true;
                    this._Str_17281().visible = true;
                    this._Str_17985();
                }
            }
            var k:IWindowContainer = IWindowContainer(this._configureContainer.findChildByName("select_furni_container"));
            k.height = Util._Str_2647(k);
        }

        private function _Str_17985():void
        {
            var k:WiredFurniture = this._Str_3959();
            var _local_2:String = (((k as ActionType) != null) ? "effect" : (((k as WiredTrigger) != null) ? "trigger" : "condition"));
            var _local_3:String = "wiredfurni.pickfurnis.";
            var _local_4:String = ((((_local_3 + _local_2) + k.code) + ".") + this._updated._Str_6040);
            var _local_5:String = this._roomEvents.localization.getLocalization(_local_4, "");
            Logger.log(((("Searching with key I: " + _local_4) + " got ") + _local_5));
            if (_local_5 == "")
            {
                _local_4 = (((_local_3 + _local_2) + ".") + this._updated._Str_6040);
                _local_5 = this._roomEvents.localization.getLocalization(_local_4, _local_4);
                Logger.log(((("Searching with key II: " + _local_4) + " got ") + _local_5));
            }
            this._Str_17281().caption = _local_5;
        }

        public function _Str_25654(k:int):void
        {
            if (this._window == null)
            {
                return;
            }
            if (!this._window.visible)
            {
                return;
            }
            if (this._updated.id == k)
            {
                this._window.visible = false;
                return;
            }
            if (this._stuffs[k])
            {
                delete this._stuffs[k];
                this.refresh();
            }
        }

        private function _Str_24143(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            /*if (!this._Str_3233(this._updated.id))
            {
                this._roomEvents.windowManager.confirm("${wiredfurni.nonowner.change.confirm.title}", "${wiredfurni.nonowner.change.confirm.body}", 0, this._Str_24497);
            }
            else
            {*/
                this.update();
            //}
        }

        private function _Str_24497(k:_Str_2910, _arg_2:WindowEvent):void
        {
            k.dispose();
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                this.update();
            }
        }

        private function update():void
        {
            var k:WiredFurniture = this._Str_3959();
            var _local_2:String = k.validate(((k.hasSpecialInputs) ? this._Str_10876() : null), this._roomEvents);
            if (_local_2 != null)
            {
                this._roomEvents.windowManager.alert("Update failed", _local_2, 0, null);
                return;
            }
            if ((this._updated as TriggerDefinition) != null)
            {
                this._roomEvents.send(new UpdateTriggerMessageComposer(this._updated.id, this._Str_18203(), this._Str_18309(), this._Str_10656(), this._Str_18067()));
            }
            else
            {
                if ((this._updated as ActionDefinition) != null)
                {
                    this._roomEvents.send(new UpdateActionMessageComposer(this._updated.id, this._Str_18203(), this._Str_18309(), this._Str_10656(), this._Str_23819(), this._Str_18067()));
                }
                else
                {
                    if ((this._updated as ConditionDefinition) != null)
                    {
                        this._roomEvents.send(new UpdateConditionMessageComposer(this._updated.id, this._Str_18203(), this._Str_18309(), this._Str_10656(), this._Str_18067()));
                    }
                }
            }
        }

        public function _Str_23819():int
        {
            var k:ActionType = ActionType(this._Str_3959());
            return (k._Str_17249) ? this._delaySlider.getValue() : 0;
        }

        private function _Str_22441(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._help.open(((this._window.x + this._window.width) + 5), this._window.y);
        }

        private function _Str_23536(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            var _local_3:WiredFurniture = this._Str_3959();
            this._updated._Str_6040 = ((this._updated._Str_6040 < 1) ? (_local_3.requiresFurni - 1) : (this._updated._Str_6040 - 1));
            this._Str_17985();
        }

        private function _Str_24649(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            var _local_3:WiredFurniture = this._Str_3959();
            this._updated._Str_6040 = ((this._updated._Str_6040 + 1) % _local_3.requiresFurni);
            this._Str_17985();
        }

        private function _Str_23497(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._roomEvents.send(new ApplySnapshotMessageComposer(this._updated.id));
        }

        private function _Str_18203():Array
        {
            var k:WiredFurniture = this._Str_3959();
            var _local_2:IWindowContainer = ((k.hasSpecialInputs) ? this._Str_10876() : null);
            return k.readIntegerParamsFromForm(_local_2);
        }

        private function _Str_18309():String
        {
            var k:WiredFurniture = this._Str_3959();
            var _local_2:IWindowContainer = ((k.hasSpecialInputs) ? this._Str_10876() : null);
            return k.readStringParamFromForm(_local_2);
        }

        private function _Str_18067():int
        {
            if (!this._updated.stuffTypeSelectionEnabled)
            {
                return 0;
            }
            var k:WiredFurniture = this._Str_3959();
            if (((k.requiresFurni == _Str_4991) || (k.requiresFurni == _Str_5430)))
            {
                return this._updated._Str_6040;
            }
            return 0;
        }

        public function _Str_10656():Array
        {
            var _local_2:String;
            var k:Array = new Array();
            for (_local_2 in this._stuffs)
            {
                k.push(int(_local_2));
            }
            return k;
        }

        public function refresh():void
        {
            this._configureContainer.visible = false;
            this._Str_18398(this._triggerConfs);
            this._Str_18398(this._actionTypes);
            this._Str_18398(this._conditionTypes);
            this._window.content.height = Util._Str_2647(this._window.content);
            this._window.visible = true;
        }

        private function _Str_18398(k:IUserDefinedRoomEventsCtrl):void
        {
            if (!k._Str_14545(this._updated))
            {
                this.find(this._configureContainer, (k._Str_1196() + "_icon_bitmap")).visible = false;
                return;
            }
            this._configureContainer.visible = true;
            var _local_2:WiredFurniture = this._Str_3959();
            this._Str_11540(_local_2, k._Str_1196());
            this._Str_25461();
            this._Str_24875();
            this.find(this._configureContainer, "warning_container").visible = false;
            this._Str_22859();
            this._Str_23045();
            this._Str_25418();
            Util._Str_14509(this._configureContainer, 3, 5);
            this._configureContainer.height = (Util._Str_2647(this._configureContainer) + 1);
        }

        private function _Str_16874(k:int):String
        {
            var _local_2:IFurnitureData = this._roomEvents.sessionDataManager.getFloorItemData(k);
            if (_local_2 == null)
            {
                Logger.log(("COULD NOT FIND FURNIDATA FOR " + k));
                return "NAME: " + k;
            }
            return _local_2.localizedName;
        }

        private function _Str_23026(k:int):String
        {
            var _local_2:IFurnitureData = this._roomEvents.sessionDataManager.getFloorItemData(k);
            if (_local_2 == null)
            {
                Logger.log(("COULD NOT FIND FURNIDATA FOR " + k));
                return "NAME: " + k;
            }
            return _local_2.description;
        }

        private function _Str_2497(k:IWindowContainer, _arg_2:String, _arg_3:String):void
        {
            var _local_4:ITextWindow = ITextWindow(this.find(k, _arg_2));
            _local_4.caption = _arg_3;
            _local_4.height = (_local_4.textHeight + 6);
        }

        private function _Str_11540(k:WiredFurniture, _arg_2:String):void
        {
            var _local_3:IWindowContainer = IWindowContainer(this.find(this._configureContainer, "header_container"));
            this.find(_local_3, (_arg_2 + "_icon_bitmap")).visible = true;
            this._Str_2497(_local_3, "conf_name_txt", this._Str_16874(this._updated.spriteId));
            this._Str_2497(_local_3, "conf_desc_txt", this._Str_23026(this._updated.spriteId));
            var _local_4:IWindow = this.find(_local_3, "conf_name_txt");
            var _local_5:IWindow = this.find(_local_3, "conf_desc_txt");
            _local_5.y = (_local_4.y + _local_4.height);
            var _local_6:WiredFurniture = this._Str_3959();
            var _local_7:IWindow = this.find(_local_3, "apply_snapshot_txt");
            if (_local_6.hasStateSnapshot)
            {
                _local_7.visible = true;
                _local_7.y = (_local_5.y + _local_5.height);
            }
            else
            {
                _local_7.visible = false;
            }
            _local_3.height = (Util._Str_2647(_local_3) + 4);
        }

        private function _Str_25418():void
        {
            var k:IWindowContainer = IWindowContainer(this.find(this._configureContainer, "action_inputs_container"));
            if ((this._updated as ActionDefinition) == null)
            {
                k.visible = false;
                return;
            }
            var _local_2:ActionType = ActionType(this._Str_3959());
            if (!_local_2._Str_17249)
            {
                k.visible = false;
                return;
            }
            k.visible = true;
        }

        private function _Str_22859():void
        {
            var _local_4:int;
            if ((this._updated as ActionDefinition) == null)
            {
                return;
            }
            var k:ActionDefinition = ActionDefinition(this._updated);
            if (k.conflictingTriggers.length < 1)
            {
                return;
            }
            var _local_2:String = "";
            var _local_3:Boolean = true;
            for each (_local_4 in k.conflictingTriggers)
            {
                _local_2 = (_local_2 + (((((_local_3) ? "" : ", ") + "'") + this._Str_16874(_local_4)) + "'"));
                _local_3 = false;
            }
            this._roomEvents.localization.registerParameter("wiredfurni.conflictingtriggers.text", "triggers", _local_2);
            this._Str_22112(this._roomEvents.localization.getLocalization("wiredfurni.conflictingtriggers.caption"), this._roomEvents.localization.getLocalization("wiredfurni.conflictingtriggers.text"));
        }

        private function _Str_23045():void
        {
            var _local_4:int;
            if ((this._updated as TriggerDefinition) == null)
            {
                return;
            }
            var k:TriggerDefinition = TriggerDefinition(this._updated);
            if (k.conflictingActions.length < 1)
            {
                return;
            }
            var _local_2:String = "";
            var _local_3:Boolean = true;
            for each (_local_4 in k.conflictingActions)
            {
                _local_2 = (_local_2 + (((((_local_3) ? "" : ", ") + "'") + this._Str_16874(_local_4)) + "'"));
                _local_3 = false;
            }
            this._roomEvents.localization.registerParameter("wiredfurni.conflictingactions.text", "actions", _local_2);
            this._Str_22112(this._roomEvents.localization.getLocalization("wiredfurni.conflictingactions.caption"), this._roomEvents.localization.getLocalization("wiredfurni.conflictingactions.text"));
        }

        private function _Str_22112(k:String, _arg_2:String):void
        {
            var _local_3:IWindowContainer = IWindowContainer(this.find(this._configureContainer, "warning_container"));
            this._Str_2497(_local_3, "caption_txt", k);
            this._Str_2497(_local_3, "desc_txt", _arg_2);
            var _local_4:IWindow = this.find(_local_3, "caption_txt");
            this.find(_local_3, "desc_txt").y = (_local_4.y + _local_4.height);
            _local_3.height = (Util._Str_2647(_local_3) + 4);
            this.find(this._configureContainer, "warning_container").visible = true;
        }

        private function _Str_25461():void
        {
            var _local_2:IWindowContainer;
            var k:IWindowContainer = IWindowContainer(this._configureContainer.findChildByName("custom_inputs_container"));
            Util._Str_2930(k);
            if (this._Str_3959().hasSpecialInputs)
            {
                _local_2 = this._Str_10876();
                _local_2.visible = true;
            }
            k.height = Util._Str_2647(k);
        }

        private function _Str_10876():IWindowContainer
        {
            var k:IUserDefinedRoomEventsCtrl = this._Str_19071();
            var _local_2:WiredFurniture = this._Str_3959();
            var _local_3:IWindowContainer = IWindowContainer(this._configureContainer.findChildByName("custom_inputs_container"));
            var _local_4:String = (k._Str_1196() + _local_2.code);
            var _local_5:IWindowContainer = IWindowContainer(_local_3.getChildByName(_local_4));
            if (_local_5 == null)
            {
                _local_5 = IWindowContainer(this._roomEvents.getXmlWindow(((("ude_" + k._Str_1196()) + "_inputs_") + _local_2.code)));
                _local_5.name = _local_4;
                _local_3.addChild(_local_5);
                _local_2.onInit(_local_5, this._roomEvents);
            }
            return _local_5;
        }

        private function _Str_24875():void
        {
            var k:IWindowContainer = IWindowContainer(this._configureContainer.findChildByName("select_furni_container"));
            if (!this._Str_19885())
            {
                k.visible = false;
                return;
            }
            k.visible = true;
            var _local_2:IWindow = k.findChildByName("furni_name_txt");
            var _local_3:int = this._Str_10656().length;
            var _local_4:int = this._updated.maximumItemSelectionCount;
            this._roomEvents.localization.registerParameter("wiredfurni.pickfurnis.caption", "count", ("" + _local_3));
            this._roomEvents.localization.registerParameter("wiredfurni.pickfurnis.caption", "limit", ("" + _local_4));
        }

        private function _Str_21929():IWindow
        {
            return this._configureContainer.findChildByName("dec_stuff_sel_button");
        }

        private function _Str_21281():IWindow
        {
            return this._configureContainer.findChildByName("inc_stuff_sel_button");
        }

        private function _Str_17281():IWindow
        {
            return this._configureContainer.findChildByName("furni_type_matches_txt");
        }

        private function _Str_3233(k:int):Boolean
        {
            var _local_2:IRoomObject = this._roomEvents.roomEngine.getRoomObject(this._roomEvents.roomId, k, RoomObjectCategoryEnum.CONST_10);
            if (_local_2 == null)
            {
                return false;
            }
            var _local_3:IRoomObjectModel = _local_2.getModel();
            if (_local_3 == null)
            {
                return false;
            }
            var _local_4:Number = _local_2.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_OWNER_ID);
            return _local_4 == this._roomEvents.sessionDataManager.userId;
        }
    }
}
