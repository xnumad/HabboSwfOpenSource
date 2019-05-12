package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.object.data.VoteResultStuffData;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureVoteMajorityLogic extends FurnitureMultistateLogic 
    {


        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_3:VoteResultStuffData;
            super.processUpdateMessage(k);
            var _local_2:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (_local_2 != null)
            {
                _local_3 = (_local_2.data as VoteResultStuffData);
                if (_local_3 != null)
                {
                    object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_VOTE_MAJORITY_RESULT, _local_3.result);
                }
            }
        }
    }
}
