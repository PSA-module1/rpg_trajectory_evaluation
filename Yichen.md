- 1. Use `bag_to_poses.py` to convert bag file to poses
```bash
python bag_to_pose.py \
/root/bagfile/corriere/CanB_H7_RTP_2023.4.10/2023-08-13-16-29-48.bag \
/Odometry \
--msg_type PoseWithCovarianceStamped \
--output fast_lio_stamped_poses.txt
```
- 2. Use `analyze_trajectory_single_test.py` to analyze the trajectory
```bash
python analyze_trajectory_single_test.py /root/bagfile/corriere/CanB_H7_RTP_2023.4.10
```