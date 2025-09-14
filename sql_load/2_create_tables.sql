-- Create patients table
CREATE TABLE public.patients
(
    patient_id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    gender TEXT,
    date_of_birth DATE,
    contact_number TEXT,
    address TEXT,
    registration_date DATE,
    insurance_provider TEXT,
    insurance_number TEXT,
    email TEXT
);

-- Create doctors table
CREATE TABLE public.doctors
(
    doctor_id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    specialization TEXT,
    phone_number TEXT,
    years_experience INT,
    hospital_branch TEXT,
    email TEXT
);

-- Create appointments table
CREATE TABLE public.appointments
(
    appointment_id TEXT PRIMARY KEY,
    patient_id TEXT,
    doctor_id TEXT,
    appointment_date DATE,
    appointment_time TIME,
    reason_for_visit TEXT,
    status TEXT,
    FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES public.doctors(doctor_id)
);

-- Create treatments table
CREATE TABLE public.treatments
(
    treatment_id TEXT PRIMARY KEY,
    appointment_id TEXT,
    treatment_type TEXT,
    description TEXT,
    cost NUMERIC,
    treatment_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES public.appointments(appointment_id)
);

-- Create billing table
CREATE TABLE public.billing
(
    bill_id TEXT PRIMARY KEY,
    patient_id TEXT,
    treatment_id TEXT,
    bill_date DATE,
    amount NUMERIC,
    payment_method TEXT,
    payment_status TEXT,
    FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES public.treatments(treatment_id)
);

-- (Optional) Set ownership of the tables to postgres
ALTER TABLE public.billing OWNER TO postgres;
ALTER TABLE public.treatments OWNER TO postgres;
ALTER TABLE public.appointments OWNER TO postgres;
ALTER TABLE public.patients OWNER TO postgres;
ALTER TABLE public.doctors OWNER TO postgres;


-- Indexes for hospital schema (foreign keys)
CREATE INDEX idx_appointments_patient_id ON public.appointments (patient_id);
CREATE INDEX idx_appointments_doctor_id ON public.appointments (doctor_id);
CREATE INDEX idx_treatments_appointment_id ON public.treatments (appointment_id);
CREATE INDEX idx_billing_patient_id ON public.billing (patient_id);
CREATE INDEX idx_billing_treatment_id ON public.billing (treatment_id);