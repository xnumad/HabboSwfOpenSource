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
        private var _questionChoices:Vector.<QuestionChoice>;

        public function PollQuestion()
        {
            this._children = new Vector.<PollQuestion>();
            this._questionChoices = new Vector.<QuestionChoice>();
        }

        public function get questionId():int
        {
            return this._questionId;
        }

        public function set questionId(k:int):void
        {
            this._questionId = k;
        }

        public function get questionType():int
        {
            return this._questionType;
        }

        public function set questionType(k:int):void
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

        public function get questionText():String
        {
            return this._questionText;
        }

        public function set questionText(k:String):void
        {
            this._questionText = k;
        }

        public function get questionCategory():int
        {
            return this._questionCategory;
        }

        public function set questionCategory(k:int):void
        {
            this._questionCategory = k;
        }

        public function get questionAnswerType():int
        {
            return this._questionAnswerType;
        }

        public function set questionAnswerType(k:int):void
        {
            this._questionAnswerType = k;
        }

        public function get questionAnswerCount():int
        {
            return this._questionAnswerCount;
        }

        public function set questionAnswerCount(k:int):void
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

        public function get questionChoices():Vector.<QuestionChoice>
        {
            return this._questionChoices;
        }

        public function set questionChoices(k:Vector.<QuestionChoice>):void
        {
            this._questionChoices = k;
        }
    }
}
