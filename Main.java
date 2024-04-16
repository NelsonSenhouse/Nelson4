public class Main
{
    public static void main(String[] args)
    {
        printArr(randArr());
    }

    public static int[] randArr()
    {
        int[] nums = new int[20];
        for (int i = 0; i < 20; i++)
        {
            int x = (int)(Math.random() * 100 + 1);
            nums[i] = x;
        }
        return nums;
    }

    public static void printArr(int[] nums)
    {
        for(int num : nums)
        {
            System.out.print(num + ", ");
        }
    }
}