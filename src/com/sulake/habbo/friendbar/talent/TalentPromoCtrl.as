package com.sulake.habbo.friendbar.talent
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.communication.messages.incoming.talent.TalentTrackLevelMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.talent.TalentLevelUpEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.outgoing.talent.GetTalentTrackLevelMessageComposer;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackLevelMessageParser;
    import com.sulake.habbo.communication.messages.parser.talent.TalentLevelUpMessageParser;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.talent.GetTalentTrackMessageComposer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class TalentPromoCtrl implements IDisposable 
    {
        private static const _Str_3591:uint = 4286084205;
        private static const _Str_3385:uint = 4283781966;

        private var _manager:HabboTalent;
        private var _window:IWindowContainer;
        private var _level:int;
        private var _maxLevel:int;
        private var _originalHeight:int;

        public function TalentPromoCtrl(k:HabboTalent)
        {
            this._manager = k;
        }

        public function dispose():void
        {
            if (this._Str_8061())
            {
                this._manager.toolbar.extensionView.detachExtension(ToolbarDisplayExtensionIds.TALENT_PROMO);
            }
            this._manager = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._manager == null;
        }

        public function initialize():void
        {
            if (!this.enabled)
            {
                return;
            }
            this._manager.communicationManager.addHabboConnectionMessageEvent(new TalentTrackLevelMessageEvent(this._Str_23765));
            this._manager.communicationManager.addHabboConnectionMessageEvent(new TalentLevelUpEvent(this._Str_16796));
            this._manager.communicationManager.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
        }

        private function onUserObject(k:UserObjectEvent):void
        {
            this._manager.send(new GetTalentTrackLevelMessageComposer(this._Str_7925));
        }

        private function _Str_23765(k:TalentTrackLevelMessageEvent):void
        {
            var _local_2:TalentTrackLevelMessageParser = k.getParser();
            if (_local_2.talentTrackName == this._Str_7925)
            {
                this._maxLevel = _local_2._Str_16859;
                this._level = _local_2.level;
                this.refresh();
            }
        }

        private function _Str_16796(k:TalentLevelUpEvent):void
        {
            var _local_2:TalentLevelUpMessageParser = k.getParser();
            if (_local_2.talentTrackName == this._Str_7925)
            {
                this._level = _local_2.level;
                this.refresh();
            }
        }

        private function refresh():void
        {
            if (((!(this.enabled)) || (this._Str_23367)))
            {
                this.close();
                return;
            }
            this.prepareWindow();
            this.setText("title");
            this._window.x = 0;
            this._window.y = 0;
            if (this._Str_8061())
            {
                this._manager.toolbar.extensionView.attachExtension(ToolbarDisplayExtensionIds.TALENT_PROMO, this._window, ExtensionFixedSlotsEnum._Str_16454);
            }
        }

        private function setText(k:String):void
        {
            this._window.findChildByName((k + "_txt")).caption = (((("${talentpromo." + this._Str_7925) + ".") + k) + "}");
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IWindowContainer(this._manager.getXmlWindow("track_promo"));
            this._window.addEventListener(WindowMouseEvent.CLICK, this._Str_25480);
            this._window.addEventListener(WindowMouseEvent.OVER, this._Str_7963);
            this._window.addEventListener(WindowMouseEvent.OUT, this._Str_7021);
            this._originalHeight = this._window.height;
        }

        public function close():void
        {
            if (this._window != null)
            {
                if (this._Str_8061())
                {
                    this._manager.toolbar.extensionView.detachExtension(ToolbarDisplayExtensionIds.TALENT_PROMO);
                }
            }
        }

        private function _Str_25480(k:WindowEvent, _arg_2:IWindow=null):void
        {
            if (((k.type == WindowMouseEvent.CLICK) && (this.enabled)))
            {
                this._manager.tracking.trackTalentTrackOpen(this._Str_7925, "talentpromo");
                this._manager.send(new GetTalentTrackMessageComposer(this._Str_7925));
            }
        }

        private function _Str_8061():Boolean
        {
            return (((!(this._manager == null)) && (!(this._manager.toolbar == null))) && (!(this._manager.toolbar.extensionView == null))) && (this.enabled);
        }

        private function get enabled():Boolean
        {
            return !(this._Str_7925 == "");
        }

        private function get _Str_7925():String
        {
            return this._manager.getProperty("talentpromo.track");
        }

        private function get _Str_23367():Boolean
        {
            return this._level >= this._maxLevel;
        }

        private function _Str_7963(k:WindowMouseEvent):void
        {
            this._window.findChildByTag("BGCOLOR").color = _Str_3591;
        }

        private function _Str_7021(k:WindowMouseEvent):void
        {
            this._window.findChildByTag("BGCOLOR").color = _Str_3385;
        }
    }
}
