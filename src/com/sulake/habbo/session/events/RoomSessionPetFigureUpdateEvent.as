package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetFigureUpdateEvent extends RoomSessionEvent 
    {
        public static const PET_FIGURE_UPDATE:String = "RSPFUE_PET_FIGURE_UPDATE";

        private var _petId:int;
        private var _figure:String;

        public function RoomSessionPetFigureUpdateEvent(k:IRoomSession, id:int, figure:String, bubbles:Boolean=false, cancellable:Boolean=false)
        {
            super(PET_FIGURE_UPDATE, k, bubbles, cancellable);
            this._petId = id;
            this._figure = figure;
        }

        public function get id():int
        {
            return this._petId;
        }

        public function get figure():String
        {
            return this._figure;
        }
    }
}
