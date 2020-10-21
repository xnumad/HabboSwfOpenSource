package com.sulake.habbo.sound
{
    import flash.media.SoundChannel;
    import flash.media.Sound;
    import flash.events.Event;
    import flash.media.SoundTransform;

    public class HabboSoundBase implements IHabboSound 
    {
        private var _soundChannel:SoundChannel = null;
        private var _Str_3136:Boolean;
        private var _Str_3026:Number;
        private var _Str_5454:int;
        protected var _Str_4166:Sound = null;

        public function HabboSoundBase(k:Sound, _arg_2:int=0)
        {
            this._Str_4166 = k;
            this._Str_4166.addEventListener(Event.COMPLETE, this.onComplete);
            this._Str_3026 = 1;
            this._Str_3136 = false;
            this._Str_5454 = _arg_2;
        }

        protected function _Str_26043():Sound
        {
            return this._Str_4166;
        }

        protected function _Str_15495():SoundChannel
        {
            return this._soundChannel;
        }

        protected function _Str_20695(k:SoundChannel):void
        {
            this._soundChannel = k;
        }

        protected function _Str_22198(k:Boolean):void
        {
            this._Str_3136 = k;
        }

        public function dispose():void
        {
            this.stop();
            this._soundChannel = null;
            this._Str_4166 = null;
        }

        public function play(k:Number=0):Boolean
        {
            this._Str_3136 = false;
            this._soundChannel = this._Str_4166.play(0, this._Str_5454);
            this._Str_3206 = this._Str_3026;
            return true;
        }

        public function stop():Boolean
        {
            if (this._soundChannel)
            {
                this._soundChannel.stop();
            }
            return true;
        }

        public function get _Str_3206():Number
        {
            return this._Str_3026;
        }

        public function set _Str_3206(k:Number):void
        {
            this._Str_3026 = k;
            this._Str_7399(k);
        }

        protected function _Str_7399(k:Number):void
        {
            if (this._soundChannel != null)
            {
                this._soundChannel.soundTransform = new SoundTransform(k);
            }
        }

        public function get position():Number
        {
            return this._soundChannel.position;
        }

        public function set position(k:Number):void
        {
        }

        public function get length():Number
        {
            return this._Str_4166.length;
        }

        public function get ready():Boolean
        {
            return !(this._Str_4166.isBuffering);
        }

        public function get _Str_21060():Boolean
        {
            return !(this._Str_3136);
        }

        public function get fadeOutSeconds():Number
        {
            return 0;
        }

        public function set fadeOutSeconds(k:Number):void
        {
        }

        public function get fadeInSeconds():Number
        {
            return 0;
        }

        public function set fadeInSeconds(k:Number):void
        {
        }

        private function onComplete(k:Event):void
        {
            this._Str_3136 = true;
        }
    }
}
