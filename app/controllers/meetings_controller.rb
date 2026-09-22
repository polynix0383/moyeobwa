class MeetingsController < ApplicationController
  TEMP_MEETINGS = [
    { id: 1, title: "주말 등산 모임", description: "북한산 둘레길을 함께 걷고 정상에서 도시락을 먹어요.", held_on: Date.new(2026, 10, 4), location: "북한산 입구" },
    { id: 2, title: "프론트엔드 스터디", description: "매주 모여 React와 최신 웹 기술을 함께 공부합니다.", held_on: Date.new(2026, 10, 8), location: "강남 스터디카페" },
    { id: 3, title: "사진 촬영 모임", description: "필름 카메라로 도시 골목길을 함께 촬영해요.", held_on: Date.new(2026, 10, 12), location: "익선동" }
  ].freeze

  def index
    @meetings = TEMP_MEETINGS
  end

  def show
    @meeting = TEMP_MEETINGS.find { |meeting| meeting[:id] == params[:id].to_i }
    raise ActionController::RoutingError, "Not Found" if @meeting.nil?
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      redirect_to meetings_path, notice: "모임이 생성되었습니다."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :description, :held_on, :location, :capacity)
  end
end
