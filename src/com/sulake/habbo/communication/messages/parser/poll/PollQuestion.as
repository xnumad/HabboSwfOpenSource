package com.sulake.habbo.communication.messages.parser.poll
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class PollQuestion 
    {
        public static const _Str_12458:int = 0;
        public static const _Str_19176:int = 1;
        public static const _Str_20133:int = 2;
        public static const _Str_20448:int = 3;

        private var _questionId:int;
        private var _questionType:int;
        private var _sortOrder:int;
        private var _questionCategory:int;
        private var _questionText:String;
        private var _questionAnswerType:int;
        private var _questionAnswerCount:int;
        private var _children:Vector.<PollQuestion>;
        private var _questionChoices:Vector.<_Str_4224>;

        public function PollQuestion()
        {
            this._children = new Vector.<PollQuestion>();
            this._questionChoices = new Vector.<_Str_4224>();
        }

        public function get _Str_3218():int
        {
            return this._questionId;
        }

        public function set _Str_3218(k:int):void
        {
            this._questionId = k;
        }

        public function get _Str_7200():int
        {
            return this._questionType;
        }

        public function set _Str_7200(k:int):void
        {
            this._questionType = k;
        }

        public function get sortOrder():int
        {
            return this._sortOrder;
        }

        public function set sortOrder(sortOrder:int):void
        {
            this._sortOrder = sortOrder;
        }

        public function get _Str_18860():String
        {
            return this._questionText;
        }

        public function set _Str_18860(k:String):void
        {
            this._questionText = k;
        }

        public function get _Str_18099():int
        {
            return this._questionCategory;
        }

        public function set _Str_18099(k:int):void
        {
            this._questionCategory = k;
        }

        public function get _Str_22139():int
        {
            return this._questionAnswerType;
        }

        public function set _Str_22139(k:int):void
        {
            this._questionAnswerType = k;
        }

        public function get _Str_16828():int
        {
            return this._questionAnswerCount;
        }

        public function set _Str_16828(k:int):void
        {
            this._questionAnswerCount = k;
        }

        public function get children():Vector.<PollQuestion>
        {
            return this._children;
        }

        public function set children(children:Vector.<PollQuestion>):void
        {
            this._children = children;
        }

        public function get _Str_6909():Vector.<_Str_4224>
        {
            return this._questionChoices;
        }

        public function set _Str_6909(k:Vector.<_Str_4224>):void
        {
            this._questionChoices = k;
        }
    }
}
