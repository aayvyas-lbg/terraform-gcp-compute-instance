project_id = attribute('project_id')
location = attribute('location')
cluster_name = attribute('name')

random_id_used=""
if attribute('random_id_used') != ""
  random_id_used = "-#{attribute('random_id_used')}"
end

control "default" do
  title "Google Compute Engine GKE configuration"
  tag controltag: 'lbg'
  describe command("unset HTTP_PROXY && unset HTTPS_PROXY && unset NO_PROXY && unset http_proxy && unset https_proxy && unset no_proxy && gcloud beta --project=#{project_id} compute instances --region=#{location} describe #{name} --format=json") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq '' }

    let!(:data) do
      if subject.exit_status == 0
        JSON.parse(subject.stdout)
      else
        {}
      end
    end
end