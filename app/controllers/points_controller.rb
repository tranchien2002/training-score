class PointsController < ApplicationController
  before_action :authenticate_request!

  def show
    point = Point.find_by(params[:id]) if params[:id].present?
    if point.present?
      render json: {
          status: "success",
          point: point.as_json(except: [ :created_at, :updated_at])
      }
    else
      render json: {
          status: "not found"
      }
    end
  end

  def get_form
    @point = Point.find_or_create_by(user_id: @current_user.id, user_name: @current_user.name)
    render json: {
      point: @point.as_json(except: [ :created_at, :updated_at])
    }
  end

  def index
    if @current_user.monitor?
      @points = Point.waiting_monitor
    elsif @current_user.teacher?
      @points = Point.waiting_teacher
    else
      @points = nil
    end
    render json: {
      points: @points
    }
  end

  def student_submit
    if params[:point_id]
      point = Point.find_by(id: params[:point_id])
      if params[:message]
        message = params[:message]
      else
        message = nil
      end
      point.update_attributes student_params.merge(student_verify: true, message: message)
      render json: {
        status: "success",
        poin: point.as_json(except: [:created_at, :updated_at])
      }
    else
      render json: {
        status: "not found"
      }
    end
  end

  def verify
    if params[:point_id]
      point = Point.find_by(id: params[:point_id])
      if params[:message]
        message = params[:message]
      else
        message = nil
      end
      if @current_user.student?
        point.update_attributes student_verify: true, message: message
        render json: {
            status: "success"
        }
      elsif @current_user.monitor?
        point.update_attributes monitor_params.merge(monitor_verify: true, message: message)
        render json: {
            status: "success"
        }
      elsif @current_user.teacher?
        point.update_attributes teacher_verify: true, message: nil
        render json: {
            status: "success"
        }
      else
        render json: {
            status: "fail"
        }
      end
    else
      render json: {
        status: "not found"
      }
    end
  end

  def reject
    if params[:point_id]
      point = Point.find_by(id: params[:point_id])
      if params[:message]
        message = params[:message]
      else
        message = "reject"
      end
      if @current_user.monitor?
        point.update_attributes monitor_params.merge(student_verify: false, message: message)
        render json: {
            status: "success",
            point: point.as_json(except: [:created_at, :updated_at])
        }
      elsif @current_user.teacher?
        point.update_attributes monitor_verify: false, message: message
        render json: {
            status: "success"
        }
      end
    else
      render json: {
        status: "not found"
      }
    end
  end


  private
  def monitor_params
    params.permit :point1_monitor, :point2_monitor, :point3_monitor
  end

  def student_params
    params.permit :point1, :point2, :point3
  end
end
