package com.sulake.habbo.phonenumber
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboToolbar;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming._Str_447._Str_9537;
    import com.sulake.habbo.communication.messages.incoming._Str_447._Str_8427;
    import com.sulake.habbo.communication.messages.incoming._Str_447._Str_9151;
    import com.sulake.habbo.communication.messages.outgoing._Str_391._Str_9957;
    import com.sulake.habbo.communication.messages.outgoing._Str_391._Str_10410;
    import com.sulake.habbo.communication.messages.outgoing._Str_391._Str_6202;
    import com.sulake.habbo.communication.messages.outgoing._Str_391._Str_7498;
    import flash.utils.getTimer;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.toolbar.ExtensionFixedSlotsEnum;

    public class HabboPhoneNumber extends Component 
    {
        protected var _Str_2355:IHabboCommunicationManager;
        protected var _Str_2904:IHabboLocalizationManager;
        protected var _Str_2318:ISessionDataManager;
        protected var _Str_2290:IHabboToolbar;
        protected var _Str_2277:IHabboWindowManager;
        private var _Str_2310:IConnection;
        private var _Str_9469:PhoneNumberCollectView;
        private var _Str_7950:PhoneNumberCollectMinimizedView;
        private var _Str_9578:VerificationCodeInputView;
        private var _Str_8160:VerificationCodeInputMinimizedView;
        private var _Str_15062:int;

        public function HabboPhoneNumber(k:IContext, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _Str_2355 = k;
            }, true), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _Str_2318 = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _Str_2277 = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _Str_2904 = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _Str_2290 = k;
            })]));
        }

        override protected function initComponent():void
        {
            if (getBoolean("sms.identity.verification.enabled"))
            {
                this._Str_2310 = this._Str_2355.connection;
                this._Str_2310.addMessageEvent(new _Str_9537(this._Str_24899));
                this._Str_2310.addMessageEvent(new _Str_8427(this._Str_23318));
                this._Str_2310.addMessageEvent(new _Str_9151(this._Str_22688));
            }
        }

        public function _Str_22965(k:String, _arg_2:String):void
        {
            this._Str_2310.send(new _Str_9957(k, _arg_2));
        }

        public function _Str_24369(k:String):void
        {
            if (!k)
            {
                return;
            }
            k = k.toUpperCase();
            this._Str_2310.send(new _Str_10410(k));
        }

        public function _Str_23711():void
        {
            this._Str_2310.send(new _Str_6202(ClientPhoneVerificationStatusEnum._Str_9095));
            this._Str_7383();
        }

        public function _Str_17799(k:Boolean):void
        {
            if (k)
            {
                this._Str_7383();
                this._Str_25774();
            }
            else
            {
                this._Str_21501();
                this._Str_16750();
            }
        }

        public function _Str_16951(k:Boolean):void
        {
            if (k)
            {
                this._Str_9778();
                this._Str_19391();
            }
            else
            {
                this._Str_20335();
                this._Str_13939();
            }
        }

        public function _Str_24068():void
        {
            this._Str_9778();
            this._Str_2310.send(new _Str_7498());
        }

        private function _Str_23318(k:_Str_8427):void
        {
            switch (k.getParser()._Str_3278)
            {
                case PhoneNumberStatusEnum._Str_9489:
                    this._Str_7383();
                    return;
                case PhoneNumberStatusEnum.OK:
                case PhoneNumberStatusEnum._Str_11502:
                case PhoneNumberStatusEnum._Str_13360:
                    this._Str_7383();
                    this._Str_15062 = (k.getParser()._Str_24596 + getTimer());
                    this._Str_13939();
                    return;
                case PhoneNumberStatusEnum.ERROR:
                case PhoneNumberStatusEnum._Str_14795:
                case PhoneNumberStatusEnum._Str_13712:
                case PhoneNumberStatusEnum._Str_17772:
                    if (((!(this._Str_7950)) && (!(this._Str_9469))))
                    {
                        this._Str_16750();
                    }
                    else
                    {
                        if (this._Str_7950)
                        {
                            this._Str_17799(false);
                        }
                    }
                    this._Str_2277.alert("${generic.alert.title}", (("${phone.number.collect.error." + k.getParser()._Str_3278) + "}"), 0, null);
                    this._Str_9469._Str_16661(k.getParser()._Str_3278);
                    return;
            }
        }

        private function _Str_22688(k:_Str_9151):void
        {
            switch (k.getParser()._Str_3278)
            {
                case PhoneNumberStatusEnum._Str_9489:
                case PhoneNumberStatusEnum.OK:
                    this._Str_9778();
                    return;
                case PhoneNumberStatusEnum.ERROR:
                    if (((!(this._Str_8160)) && (!(this._Str_9578))))
                    {
                        this._Str_15062 = (getTimer() + k.getParser()._Str_17328);
                        this._Str_13939();
                    }
                    else
                    {
                        if (this._Str_8160)
                        {
                            this._Str_16951(false);
                        }
                    }
                    this._Str_9578._Str_16661(k.getParser()._Str_3278);
                    return;
            }
        }

        private function _Str_24899(k:_Str_9537):void
        {
            var _local_2:int = k.getParser()._Str_24164;
            var _local_3:int = k.getParser()._Str_24357;
            context.configuration.setProperty("phone.collection.status", _local_2.toString());
            context.configuration.setProperty("phone.verification.status", _local_3.toString());
            if (_local_2 == ClientPhoneVerificationStatusEnum._Str_9095)
            {
                return;
            }
            if (((_local_2 == ClientPhoneVerificationStatusEnum._Str_18531) && ((_local_3 == PhoneNumberStatusEnum._Str_11502) || (_local_3 == PhoneNumberStatusEnum._Str_13360))))
            {
                this._Str_7383();
                if (_local_2 == ClientPhoneVerificationStatusEnum._Str_6027)
                {
                    this._Str_19391();
                }
                else
                {
                    this._Str_15062 = (k.getParser()._Str_17328 + getTimer());
                    this._Str_13939();
                }
                return;
            }
            switch (_local_3)
            {
                case PhoneNumberStatusEnum._Str_4917:
                case PhoneNumberStatusEnum._Str_11502:
                    this._Str_16750();
                    return;
                case PhoneNumberStatusEnum._Str_9489:
                case PhoneNumberStatusEnum.OK:
                    this._Str_7383();
                    this._Str_9778();
                    return;
                case PhoneNumberStatusEnum.ERROR:
                case PhoneNumberStatusEnum._Str_14795:
                case PhoneNumberStatusEnum._Str_13712:
                    Logger.log("INVALID STATE!! Phone number / verify errors should not be handled here!");
                    return;
            }
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._Str_2277;
        }

        public function get localizationManager():IHabboLocalizationManager
        {
            return this._Str_2904;
        }

        public function get _Str_20480():int
        {
            return this._Str_15062;
        }

        private function _Str_16750():void
        {
            this._Str_7383();
            var k:String = context.configuration.getProperty("phone.number.preferred.countries");
            var _local_2:Array = k.split(",");
            this._Str_9469 = new PhoneNumberCollectView(this, _local_2);
        }

        private function _Str_13939():void
        {
            this._Str_9778();
            this._Str_9578 = new VerificationCodeInputView(this);
        }

        private function _Str_25774():void
        {
            this._Str_21501();
            this._Str_7950 = new PhoneNumberCollectMinimizedView(this);
            this._Str_2290.extensionView.attachExtension(ToolbarDisplayExtensionIds.PHONE_NUMBER, this._Str_7950.window, ExtensionFixedSlotsEnum._Str_13012);
        }

        private function _Str_19391():void
        {
            this._Str_20335();
            this._Str_8160 = new VerificationCodeInputMinimizedView(this);
            this._Str_2290.extensionView.attachExtension(ToolbarDisplayExtensionIds.VERIFICATION_CODE, this._Str_8160.window, ExtensionFixedSlotsEnum._Str_13012);
        }

        private function _Str_7383():void
        {
            if (this._Str_9469)
            {
                this._Str_9469.dispose();
                this._Str_9469 = null;
            }
        }

        private function _Str_9778():void
        {
            if (this._Str_9578)
            {
                this._Str_9578.dispose();
                this._Str_9578 = null;
            }
        }

        private function _Str_21501():void
        {
            this._Str_2290.extensionView.detachExtension(ToolbarDisplayExtensionIds.PHONE_NUMBER);
            if (this._Str_7950)
            {
                this._Str_7950.dispose();
                this._Str_7950 = null;
            }
        }

        private function _Str_20335():void
        {
            this._Str_2290.extensionView.detachExtension(ToolbarDisplayExtensionIds.VERIFICATION_CODE);
            if (this._Str_8160)
            {
                this._Str_8160.dispose();
                this._Str_8160 = null;
            }
        }
    }
}
