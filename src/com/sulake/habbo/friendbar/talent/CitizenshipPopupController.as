package com.sulake.habbo.friendbar.talent
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_2752;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.session.talent.TalentEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_364._Str_3075;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class CitizenshipPopupController implements IDisposable 
    {
        private var _habboTalent:HabboTalent;
        private var _dialog:_Str_2784;
        private var _disposed:Boolean;
        private var _messageEvent:_Str_2752;
        private var _seenPopupDuringSession:Boolean;

        public function CitizenshipPopupController(k:HabboTalent)
        {
            this._habboTalent = k;
            this._messageEvent = new _Str_2752(this.onCreditBalance);
            this._habboTalent.communicationManager.addHabboConnectionMessageEvent(this._messageEvent);
        }

        private function onCreditBalance(k:IMessageEvent):void
        {
            var _local_2:Timer;
            if ((((this._habboTalent._Str_7478) && (!(this._seenPopupDuringSession))) && (this._habboTalent.getBoolean("new.user.citizenship.popup.enabled"))))
            {
                _local_2 = new Timer(10000, 1);
                _local_2.addEventListener(TimerEvent.TIMER, this._Str_22885);
                _local_2.start();
            }
        }

        private function _Str_22885(k:TimerEvent):void
        {
            this._Str_14234();
            this.show();
            this._seenPopupDuringSession = true;
        }

        private function _Str_14234():void
        {
            if (((!(this._habboTalent == null)) && (!(this._habboTalent.disposed))))
            {
                this._habboTalent.communicationManager.removeHabboConnectionMessageEvent(this._messageEvent);
            }
            this._messageEvent = null;
        }

        public function show():void
        {
            this.hide();
            this._dialog = this._habboTalent._Str_4804("citizenship_welcome");
            this._dialog._Str_2429.procedure = this._Str_3061;
            IWindowContainer(this._dialog._Str_2429).findChildByName("header_button_close").visible = false;
        }

        private function hide():void
        {
            if (((!(this._dialog == null)) && (!(this._dialog.disposed))))
            {
                this._dialog.dispose();
                this._dialog = null;
            }
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this.hide();
                this._Str_14234();
                this._habboTalent = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_3061(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this._dialog == null) || (this._dialog.disposed)) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "postpone_citizenship":
                    this.hide();
                    return;
                case "show_citizenship":
                    this.hide();
                    this._habboTalent.tracking.trackTalentTrackOpen(TalentEnum.CITIZENSHIP, "citizenshippopup");
                    this._habboTalent.send(new _Str_3075(TalentEnum.CITIZENSHIP));
                    return;
            }
        }
    }
}
