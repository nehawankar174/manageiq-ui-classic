class ApplicationHelper::Button::InstanceDetach < ApplicationHelper::Button::Basic
  def visible?
    # FIXME: feature for attach/detach is missing, testing class for now
    # Click2Cloud: Added telefonica, huawei and orange cloudmanager condition
    @record.kind_of?(ManageIQ::Providers::Openstack::CloudManager::Vm || ManageIQ::Providers::Telefonica::CloudManager::Vm || ManageIQ::Providers::Huawei::CloudManager::Vm || ManageIQ::Providers::Orange::CloudManager::Vm)
  end

  def disabled?
    if @record.number_of(:cloud_volumes).zero?
      @error_message = _("This Instance has no attached Cloud Volumes.")
    end
    @error_message.present?
  end
end
