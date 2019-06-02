package com.sulake.habbo.localization
{
    import com.sulake.core.localization.CoreLocalizationManager;
    import flash.utils.Dictionary;
    import com.sulake.habbo.localization.enum.HabboLocalizationFlags;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.Event;
    import com.sulake.habbo.communication.enum.HabboCommunicationEvent;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.localization.enum.LocalizationEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class HabboLocalizationManager extends CoreLocalizationManager implements IHabboLocalizationManager 
    {
        private var _skipExternals:Boolean = false;
        private var _badgePointLimits:Dictionary;
        private var _romanNumerals:Array;

        public function HabboLocalizationManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._badgePointLimits = new Dictionary();
            this._romanNumerals = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX", "XXI", "XXII", "XXIII", "XXIV", "XXV", "XXVI", "XXVII", "XXVIII", "XXIX", "XXX"];
            this._skipExternals = ((_arg_2 & HabboLocalizationFlags._Str_16746) > 0);
            super(k, _arg_2, _arg_3);
        }

        override public function dispose():void
        {
            super.dispose();
        }

        override protected function initComponent():void
        {
            super.initComponent();
            this.configureLocalizationLocations();
            if (this._skipExternals)
            {
                events.dispatchEvent(new Event(Event.COMPLETE));
            }
            else
            {
                context.events.addEventListener(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_AUTHENTICATED, this._Str_18093);
            }
        }

        private function _Str_18093(k:Event):void
        {
            this.requestLocalizationInit();
        }

        public function getLocalizationWithParams(k:String, _arg_2:String="", ... _args):String
        {
            var _local_4:int;
            var _local_5:int;
            if (((!(_args == null)) && (_args.length > 0)))
            {
                _local_4 = (_args.length / 2);
                _local_5 = 0;
                while (_local_5 < _local_4)
                {
                    registerParameter(k, _args[(_local_5 * 2)], _args[((_local_5 * 2) + 1)]);
                    _local_5++;
                }
            }
            return this.getLocalization(k, _arg_2);
        }

        public function _Str_21551(k:String, _arg_2:String="", _arg_3:Map=null):String
        {
            var _local_4:String;
            if (_arg_3 != null)
            {
                for (_local_4 in _arg_3)
                {
                    registerParameter(k, _local_4, _arg_3.getValue(_local_4));
                }
            }
            return this.getLocalization(k, _arg_2);
        }

        override public function getLocalization(k:String, _arg_2:String=""):String
        {
            var _local_3:String = super.getLocalization(k, _arg_2);
            return interpolate(_local_3);
        }

        public function _Str_18132(k:String):String
        {
            var _local_2:BadgeBaseAndLevel = new BadgeBaseAndLevel(k);
            var _local_3:String = this.getExistingKey([("badge_name_al_" + k), ("badge_name_al_" + _local_2.base), ("badge_name_" + k), ("badge_name_" + _local_2.base)]);
            this.registerParameter(_local_3, "roman", this.getRomanNumeral(_local_2.level));
            var _local_4:String = this.getLocalization(_local_3);
            return (_local_4 != null) ? _local_4 : "";
        }

        public function _Str_23690(k:String, _arg_2:int):String
        {
            var _local_3:BadgeBaseAndLevel = new BadgeBaseAndLevel(k);
            var _local_4:String = this.getExistingKey([("badge_desc_al_" + k), ("badge_desc_al_" + _local_3.base), ("badge_desc_" + k), ("badge_desc_" + _local_3.base)]);
            this.registerParameter(_local_4, "limit", ("" + _arg_2));
            this.registerParameter(_local_4, "roman", this.getRomanNumeral(_local_3.level));
            return this.getLocalization(_local_4);
        }

        public function _Str_16142(k:String):String
        {
            var _local_2:BadgeBaseAndLevel = new BadgeBaseAndLevel(k);
            var _local_3:String = this.getExistingKey([("badge_instruction_" + _local_2.base)]);
            this.registerParameter(_local_3, "limit", ("" + this.getBadgePointLimit(k)));
            var _local_4:String = this.getLocalization(_local_3);
            return (_local_4 != null) ? _local_4 : "";
        }

        public function _Str_21634(k:String):String
        {
            var _local_2:BadgeBaseAndLevel = new BadgeBaseAndLevel(k);
            return _local_2.base;
        }

        public function getBadgeName(k:String):String
        {
            var _local_2:BadgeBaseAndLevel = new BadgeBaseAndLevel(k);
            var _local_3:String = this._Str_21023(this.getExistingKey([("badge_name_" + k), ("badge_name_" + _local_2.base)]));
            this.registerParameter(_local_3, "roman", this.getRomanNumeral(_local_2.level));
            return this.getLocalization(_local_3);
        }

        public function getBadgeDesc(k:String):String
        {
            var _local_2:BadgeBaseAndLevel = new BadgeBaseAndLevel(k);
            var _local_3:String = this._Str_21023(this.getExistingKey([("badge_desc_" + k), ("badge_desc_" + _local_2.base)]));
            this.registerParameter(_local_3, "limit", ("" + this.getBadgePointLimit(k)));
            this.registerParameter(_local_3, "roman", this.getRomanNumeral(_local_2.level));
            return this.getLocalization(_local_3);
        }

        private function _Str_21023(k:String):String
        {
            var _local_2:String = k.replace("${", "$");
            _local_2 = _local_2.replace("{", "$");
            _local_2 = _local_2.replace("}", "$");
            return _local_2;
        }

        public function _Str_18179(k:String):String
        {
            var _local_2:BadgeBaseAndLevel = new BadgeBaseAndLevel(k);
            _local_2.level--;
            return _local_2.badgeId;
        }

        public function _Str_20202(k:String, _arg_2:int):void
        {
            this._badgePointLimits[k] = _arg_2;
        }

        private function _Str_25984(k:_Str_2418, _arg_2:*):void
        {
            k.dispose();
            printNonExistingKeys();
        }

        private function configureLocalizationLocations():void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:String;
            var _local_5:String;
            var k:int = 1;
            while (propertyExists(("localization." + k)))
            {
                _local_2 = getProperty(("localization." + k));
                _local_3 = getProperty((("localization." + k) + ".code"));
                _local_4 = getProperty((("localization." + k) + ".name"));
                _local_5 = getProperty((("localization." + k) + ".url"));
                super.registerLocalizationDefinition(_local_2, _local_4, _local_5, _local_3);
                k++;
            }
        }

        private function requestLocalizationInit():void
        {
            var k:String = getProperty("external.texts.txt");
            events.addEventListener(LocalizationEvent.LOCALIZATION_EVENT_LOCALIZATION_LOADED, this.onLocalizationLoaded);
            super.loadLocalizationFromURL(k);
        }

        private function getBadgePointLimit(k:String):int
        {
            return this._badgePointLimits[k];
        }

        private function getExistingKey(k:Array):String
        {
            var _local_2:String;
            var _local_3:String;
            for each (_local_2 in k)
            {
                _local_3 = this.getLocalization(_local_2);
                if (_local_3 != "")
                {
                    return _local_2;
                }
            }
            return "";//k[0];
        }

        private function getRomanNumeral(k:int):String
        {
            return this._romanNumerals[Math.max(0, (k - 1))];
        }

        private function parseDevelopmentLocalizations():void
        {
        }

        override protected function onLocalizationFailed(k:AssetLoaderEvent):void
        {
            HabboWebTools.logEventLog(("external_texts download error " + k.status));
            super.onLocalizationFailed(k);
        }

        public function onLocalizationLoaded(k:Event):void
        {
            var _local_2:String;
            events.removeEventListener(LocalizationEvent.LOCALIZATION_EVENT_LOCALIZATION_LOADED, this.onLocalizationLoaded);
            if (propertyExists("external.override.texts.txt"))
            {
                _local_2 = getProperty("external.override.texts.txt");
                events.addEventListener(LocalizationEvent.LOCALIZATION_EVENT_LOCALIZATION_LOADED, this.onLocalizationOverrideLoaded);
                super.loadLocalizationFromURL(_local_2);
            }
            else
            {
                events.dispatchEvent(new Event(Event.COMPLETE));
            }
        }

        public function onLocalizationOverrideLoaded(k:Event):void
        {
            events.removeEventListener(LocalizationEvent.LOCALIZATION_EVENT_LOCALIZATION_LOADED, this.onLocalizationOverrideLoaded);
            events.dispatchEvent(new Event(Event.COMPLETE));
        }
    }
}
