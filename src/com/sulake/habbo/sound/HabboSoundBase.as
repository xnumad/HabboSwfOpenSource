package com.sulake.habbo.sound
{
    import flash.media.SoundChannel;
    import flash.media.Sound;
    import flash.events.Event;
    import flash.media.SoundTransform;

    public class HabboSoundBase implements IHabboSound 
    {
        private var _Str_3467:SoundChannel = null;
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
            return this._Str_3467;
        }

        protected function _Str_20695(k:SoundChannel):void
        {
            this._Str_3467 = k;
        }

        protected function _Str_22198(k:Boolean):void
        {
            this._Str_3136 = k;
        }

        public function dispose():void
        {
            this.stop();
            this._Str_3467 = null;
            this._Str_4166 = null;
        }

        public function play(k:Number=0):Boolean
        {
            this._Str_3136 = false;
            this._Str_3467 = this._Str_4166.play(0, this._Str_5454);
            this._Str_3206 = this._Str_3026;
            return true;
        }

        public function stop():Boolean
        {
            if (this._Str_3467)
            {
                this._Str_3467.stop();
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
            if (this._Str_3467 != null)
            {
                this._Str_3467.soundTransform = new SoundTransform(k);
            }
        }

        public function get position():Number
        {
            return this._Str_3467.position;
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

        public function get _Str_4908():Number
        {
            return 0;
        }

        public function set _Str_4908(k:Number):void
        {
        }

        public function get _Str_6653():Number
        {
            return 0;
        }

        public function set _Str_6653(k:Number):void
        {
        }

        private function onComplete(k:Event):void
        {
            this._Str_3136 = true;
        }
    }
}
